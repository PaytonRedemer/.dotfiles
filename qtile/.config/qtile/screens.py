from libqtile import bar, widget
from libqtile.config import Screen

screens = [
    Screen(
        top=bar.Bar(
            [
                #widget.CurrentLayout(),
                widget.GroupBox(
                    highlight_method="text",
                    urgent_alert_method="text",
                    rounded=False,
                    hide_unused=True,
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
                    format="{char} {percent:2.0%}",
                    ),
                widget.Sep(),
                widget.Clock(
                    format="%a, %b %d %I:%M %P"
                    ),
                widget.Systray(),
            ],
            27,
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
    ),
]
