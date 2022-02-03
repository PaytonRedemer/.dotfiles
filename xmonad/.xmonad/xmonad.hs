-- Imports

import XMonad
import Data.Monoid
import System.Exit

-- Hooks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
-- import XMonad.Hooks.WindowSwallowing

-- Utils
import XMonad.Util.EZConfig
import XMonad.Util.NamedScratchpad
import XMonad.Util.Run
import XMonad.Util.SpawnOnce

-- Actions
import XMonad.Actions.CycleWS (Direction1D(..), moveTo, shiftTo, WSType(..), nextScreen, prevScreen)
import XMonad.Actions.WithAll (killAll)


-- Other
import qualified XMonad.StackSet as W
import qualified Data.Map        as M
import Data.Maybe (fromJust)

------------------------------------------------------------------------
-- Default Programs
myTerminal :: String
myTerminal = "alacritty"

myBrowser :: String
myBrowser = "brave"


-- Whether focus follows the mouse pointer.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

-- Whether clicking on a window to focus also passes the click to the window
myClickJustFocuses :: Bool
myClickJustFocuses = False

myBorderWidth   = 2 -- Width of the window border in pixels.

myModMask       = mod4Mask -- Modkey

------------------------------------------------------------------------
-- Startup Applications
myStartupHook = do
    spawnOnce "udiskie &"
    spawnOnce "flameshot &"
    spawnOnce "$HOME/.config/polybar/launch.sh &"

-- > workspaces = ["web", "irc", "code" ] ++ map show [4..9]

myWorkspaces    = [" 1 "," 2 "," 3 "," 4 "," 5 "," 6 "," 7 "," 8 "," 9 "]

myWorkspaceIndices = M.fromList $ zipWith (,) myWorkspaces [1..] -- (,) == \x y -> (x,y)
clickable ws = "<action=xdotool key super+"++show i++">"++ws++"</action>"
    where i = fromJust $ M.lookup ws myWorkspaceIndices


-- Border colors for unfocused and focused windows, respectively.
myNormalBorderColor  = "#dddddd"
myFocusedBorderColor = "#458588"

------------------------------------------------------------------------
-- Keybindings

myKeys :: [(String, X ())]
myKeys =

    -- Applications
        [ ("M-<Return>", spawn (myTerminal))
        , ("M-d", spawn "rofi -show drun -modi run -show-icons")
        , ("M-w", spawn (myBrowser))
        , ("M-s", spawn "flameshot gui")

    -- Scatchpads
        , ("M-c", namedScratchpadAction myScratchPads "calculator")
        , ("M-S-<Return>", namedScratchpadAction myScratchPads "terminal")
        , ("M-S-m", namedScratchpadAction myScratchPads "ncmpcpp")
        , ("M-S-t", namedScratchpadAction myScratchPads "todo")

    -- Xmonad

        , ("M-S-w", spawn "xmonad --recompile; xmonad --restart")
        , ("M-q", kill)
        , ("M-S-q", killAll)   -- Kill all windows on current workspace

    -- Workspace
        , ("M-.", nextScreen)  -- Switch focus to next monitor
        , ("M-,", prevScreen)  -- Switch focus to prev monitor

    -- Window Navigation
        , ("M-j", windows W.focusDown)    -- Move focus to the next window
        , ("M-k", windows W.focusUp)      -- Move focus to the prev window
        , ("M-S-j", windows W.swapDown)   -- Swap focused window with next window
        , ("M-S-k", windows W.swapUp)     -- Swap focused window with prev window

    -- Window Resizing
        , ("M-h", sendMessage Shrink)                   -- Shrink horiz window width
        , ("M-l", sendMessage Expand)                   -- Expand horiz window width
        --, ("M-M1-j", sendMessage MirrorShrink)          -- Shrink vert window width
        --, ("M-M1-k", sendMessage MirrorExpand)          -- Expand vert window width

    -- Multimedia
        , ("<XF86AudioMute>", spawn "amixer set Master toggle")
        , ("<XF86AudioLowerVolume>", spawn "amixer set Master 5%- unmute")
        , ("<XF86AudioRaiseVolume>", spawn "amixer set Master 5%+ unmute")
        , ("<XF86AudioMicMute>", spawn "amixer set Capture toggle && amixer get Capture")
        , ("<XF86MonBrightnessDown>", spawn "xbacklight -dec 5")
        , ("<XF86MonBrightnessUp>", spawn "xbacklight -inc 5")
        ]

------------------------------------------------------------------------
-- Scatchpads

myScratchPads :: [NamedScratchpad]
myScratchPads = [ NS "terminal" spawnTerm findTerm manageTerm
                , NS "ncmpcpp" spawnNcmpcpp findNcmpcpp manageNcmpcpp
                , NS "todo" spawnTodo findTodo manageTodo
                , NS "calculator" spawnCalc findCalc manageCalc
                ]

  where
    spawnTerm  = myTerminal ++ " -t scratchpad"
    findTerm   = title =? "scratchpad"
    manageTerm = customFloating $ W.RationalRect l t w h
               where
                 h = 0.9
                 w = 0.9
                 t = 0.95 -h
                 l = 0.95 -w

    spawnNcmpcpp  = myTerminal ++ " -t ncmpcpp -e ncmpcpp"
    findNcmpcpp   = title =? "ncmpcpp"
    manageNcmpcpp = customFloating $ W.RationalRect l t w h
               where
                 h = 0.9
                 w = 0.9
                 t = 0.95 -h
                 l = 0.95 -w

    spawnTodo  = myTerminal ++ " -t todo -e nvim todo"
    findTodo   = title =? "todo"
    manageTodo = customFloating $ W.RationalRect l t w h
               where
                 h = 0.9
                 w = 0.9
                 t = 0.95 -h
                 l = 0.95 -w

    spawnCalc  = "qalculate-gtk"
    findCalc   = className =? "Qalculate-gtk"
    manageCalc = customFloating $ W.RationalRect l t w h
               where
                 h = 0.5
                 w = 0.4
                 t = 0.75 -h
                 l = 0.70 -w




------------------------------------------------------------------------

-- Layouts:

myLayout = avoidStruts (tiled ||| Mirror tiled ||| Full)
  where
     -- default tiling algorithm partitions the screen into two panes
     tiled   = Tall nmaster delta ratio

     -- The default number of windows in the master pane
     nmaster = 1

     -- Default proportion of screen occupied by master pane
     ratio   = 1/2

     -- Percent of screen to increment by when resizing panes
     delta   = 3/100

------------------------------------------------------------------------
-- Window rules:
myManageHook = composeAll
    [ className =? "MPlayer"        --> doFloat
    , className =? "Gimp"           --> doFloat
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore
    ] <+> namedScratchpadManageHook myScratchPads

------------------------------------------------------------------------

-- Main

main = do
    xmonad $ ewmh def
        { manageHook = myManageHook <+> manageDocks
        , handleEventHook    = docksEventHook

        -- simple stuff
        , terminal           = myTerminal
        , focusFollowsMouse  = myFocusFollowsMouse
        , clickJustFocuses   = myClickJustFocuses
        , borderWidth        = myBorderWidth
        , modMask            = myModMask
        , workspaces         = myWorkspaces
        , normalBorderColor  = myNormalBorderColor
        , focusedBorderColor = myFocusedBorderColor

        -- keys
        -- mouseBindings      = myMouseBindings
        -- keys               = myKeys, -- Using EZconfig

        -- hooks, layouts
        , layoutHook         = myLayout
        , startupHook        = myStartupHook
        , logHook = dynamicLogWithPP $ namedScratchpadFilterOutWorkspacePP $ xmobarPP
        } `additionalKeysP` myKeys
