from libqtile.config import Click, Drag, Group, Key, Match
from libqtile.lazy import lazy

from scratchpads import scratchpads, scratchpad_keybindings

import os

mod = "mod4"
terminal = os.environ.get("TERMINAL")
launcher = "rofi -combi-modi drun,window,ssh -show combi"
browser = os.environ.get("BROWSER")

keys = [
    # Launch programs
    Key([mod], "Return", lazy.spawn(terminal)),
    Key([mod], "p", lazy.spawn(launcher)),
    Key([mod], "w", lazy.spawn(browser)),
    Key([mod], "z", lazy.spawn("flameshot gui")),

    # terminal programs
    Key([mod, "shift"], "m", lazy.spawn(terminal + " -e ncmpcpp")),
    Key([mod, "shift"], "e", lazy.spawn(terminal + " -e neomutt")),
    Key([mod, "shift"], "r", lazy.spawn(terminal + " -e ranger")),

    # volume controls
    Key([mod], "minus", lazy.spawn("volume-ctl down")),
    Key([mod], "equal", lazy.spawn("volume-ctl up")),

    Key([], "XF86AudioLowerVolume", lazy.spawn("volume-ctl down")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("volume-ctl up")),
    Key([], "XF86AudioMute", lazy.spawn("volume-ctl mute")),
    Key([], "XF86AudioMicMute", lazy.spawn("volume-ctl mute-input")),

    # brightness controls
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightness-ctl down")),
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightness-ctl up")),

    # music controls
    Key([mod, "control"], "comma", lazy.spawn("playerctl previous")),
    Key([mod, "control"], "p", lazy.spawn("playerctl play-pause")),
    Key([mod, "control"], "period", lazy.spawn("playerctl next")),


    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Multiple monitors
    Key([mod], "comma", lazy.prev_screen(), desc="Move focus to previous monitor"),
    Key([mod], "period", lazy.next_screen(), desc="Move focus to next monitor"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "s",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),

    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "f", lazy.window.toggle_fullscreen(), desc="Put the focused window to/from fullscreen mode"),
    Key([mod, "shift"], "space", lazy.window.toggle_floating(), desc='Toggle floating'),
    Key([mod], "b", lazy.hide_show_bar(), desc="Toggle bar"),
    Key([mod], "escape", lazy.spawn("xscreensaver-command -lock")),
]

groups = [Group(i) for i in "1234567890"]

for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=False),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

# Scratchpad
groups.append(scratchpads)
keys.extend(scratchpad_keybindings)

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

# TODO: I think switch screen needs to be fixed for both functions

def window_to_previous_screen(qtile, switch_group=False, switch_screen=False):
    i = qtile.screens.index(qtile.current_screen)
    group = qtile.screens[i - 1].group.name
    qtile.current_window.togroup(group, switch_group=switch_group)
    if switch_screen == True:
        qtile.cmd_to_screen(i - 1)

def window_to_next_screen(qtile, switch_group=False, switch_screen=False):
    i = qtile.screens.index(qtile.current_screen)
    if i + 1 != len(qtile.screens):
        group = qtile.screens[i + 1].group.name
    else:
        group = qtile.screens[0].group.name
    qtile.current_window.togroup(group, switch_group=switch_group)
    if switch_screen == True:
        qtile.cmd_to_screen(i + 1)

keys.extend([
    Key([mod,"shift"],  "comma", lazy.function(window_to_previous_screen)),
    Key([mod,"shift"],  "period",  lazy.function(window_to_next_screen)),
    # Key([mod,"control"],"comma",  lazy.function(window_to_next_screen, switch_screen=True)),
    # Key([mod,"control"],"period", lazy.function(window_to_previous_screen, switch_screen=True)),
])
