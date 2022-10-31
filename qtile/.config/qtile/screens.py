from libqtile import bar, widget
from libqtile.config import Screen

# TODO: Make own colors.py file
colors = {
    "foreground": "#DCD7BA",
    "background": "#1f1f28",
    "color0": "#090618",
    "color1": "#C34043",
    "color2": "#76946A",
    "color3": "#C0A36E",
    "color4": "#7E9CD8",
    "color5": "#957FB8",
    "color6": "#6A9589",
    "color7": "#C8C093",
    "color8": "#727169",
    "color9": "#E82424",
    "color10": "#98BB6C",
    "color11": "#E6C384",
    "color12": "#7FB4CA",
    "color13": "#938AA9",
    "color14": "#7AA89F",
    "color15": "#DCD7BA",
    "color16": "#FFA066",
    "color17": "#FF5D62"
}

def init_widgets():
    widget_list = [
        #widget.CurrentLayout(),
        widget.GroupBox(
            disable_drag=True,
            highlight_method="block",
            rounded=True,
            hide_unused=True,
            block_highlight_text_color="#FFFFFF"
            ),
        widget.Spacer(),
        widget.Wlan(
            interface='wlp61s0',
            disconnected_message='',
            format='{essid}'
            ),
        widget.Sep(),
        widget.PulseVolume(
            fmt='VOL {}'
        ),
        widget.Sep(),
        widget.Battery(
            charge_char="CHR",
            discharge_char="BAT",
            empty_char="EMPTY",
            unknown_char="BAT",
            format="{char} {percent:2.0%}",
            ),
        widget.Sep(),
        widget.Clock(
            format="%a, %b %d %I:%M:%S %p"
            ),
        ]
    return widget_list

def init_widgets_systray():
    widget_list = init_widgets()
    widget_list.append(widget.Systray(padding=0))
    return widget_list

bar_size = 27

screens = [
    Screen(top=bar.Bar(init_widgets_systray(), bar_size, background=colors["background"])),
    Screen(top=bar.Bar(init_widgets(), bar_size, background=colors["background"])),
    Screen(top=bar.Bar(init_widgets(), bar_size, background=colors["background"])),
]