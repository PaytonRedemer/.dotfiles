from libqtile.config import Click, Drag, Group, Key, Match
from libqtile.lazy import lazy

from scratchpads import scratchpads, scratchpad_keybindings

mod = "mod4"

keys = [
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
    Key([mod], "period", lazy.prev_screen(), desc="Move focus to previous monitor"),
    Key([mod], "comma", lazy.next_screen(), desc="Move focus to next monitor"),

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
]

workspaces = [
    {"name": "home", "key": "1", "label": ""},
    {"name": "WWW", "key": "2", "label": "", "matches": [Match(wm_class=["Chromium-browser", "Firefox", "Brave-browser"])]},
    {"name": "DEV", "key": "3","label": ""},
    {"name": "DOC", "key": "4", "label": "", "matches": [Match(wm_class=["Zathura"])]},
    {"name": "MISC", "key": "5", "label": ""},
    {"name": "CHAT", "key": "6", "label": "", "matches": [Match(wm_class=["Slack", "discord", "zoom"])]},
    {"name": "SSH", "key": "7", "label": ""},
    {"name": "VIRT", "key": "8", "label": "", "matches": [Match(wm_class=["VirtualBox"])]},
    {"name": "VID", "key": "9", "label": "", "matches": [Match(wm_class=["mpv"])]},
    {"name": "MUS", "key": "0", "label": "", "matches": [Match(wm_class=["Spotify"])]},
]

groups = []
for workspace in workspaces:
    matches = workspace["matches"] if "matches" in workspace else None
    groups.append(Group(workspace["name"], label=workspace["label"], matches=matches))
    keys.append(
        Key(
            [mod],
            workspace["key"],
            lazy.group[workspace["name"]].toscreen(),
            desc="Focus this desktop",
        )
    )
    keys.append(
        Key(
            [mod, "shift"],
            workspace["key"],
            lazy.window.togroup(workspace["name"]),
            desc="Move focused window to another group",
        )
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