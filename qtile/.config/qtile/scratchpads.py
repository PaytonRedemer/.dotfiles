from libqtile.config import DropDown, Key, ScratchPad
from libqtile.lazy import lazy

mod = "mod4"

dropdowns = [
    DropDown("terminal", "alacritty"),
    DropDown("volume", "alacritty -e pulsemixer"),
    DropDown("calc", "alacritty -e qalc"),
]

scratchpads = ScratchPad("scratchpad", dropdowns)

scratchpad_keybindings = [
    Key([mod, "shift"], "Return", lazy.group['scratchpad'].dropdown_toggle('terminal')),
    Key([mod], "v", lazy.group['scratchpad'].dropdown_toggle('volume')),
    Key([mod], "c", lazy.group['scratchpad'].dropdown_toggle('calc'))
]