from libqtile import widget
import os
from colors import colors

widget_defaults = dict(
    font="FiraCode Nerd Font Mono",
    fontsize=15,
    padding=5,
    foreground=colors["foreground"],
)
extension_defaults = widget_defaults.copy()

def init_widgets():
    widget_list = [
        # widget.CurrentLayout(),
        widget.GroupBox(
            this_screen_border = "#2D4F67", # TODO: These colors are a part of kanagawa update colors.py
            this_current_screen_border = "#2D4F67",
            disable_drag=True,
            highlight_method="block",
            rounded=True,
            hide_unused=True,
            active = colors["foreground"],
            inactive = colors["foreground"],
            ),
        widget.Spacer(),
        widget.PulseVolume(
            fmt='  VOL {}  '
        ),
        widget.Sep(),
        widget.Clock(
            format="  %a, %b %d %I:%M:%S %p "
            ),
        ]

    if os.path.isdir("/sys/class/power_supply/BAT0"):
        widget_list.insert(4, widget.Sep())
        widget_list.insert(4, widget.Battery(
            charge_char="CHR",
            discharge_char="BAT",
            empty_char="EMPTY",
            unknown_char="BAT",
            format="  {char} {percent:2.0%}  ",
            ))

    return widget_list

def init_widgets_systray():
    widget_list = init_widgets()
    widget_list.append(widget.Systray(padding=0))
    return widget_list
