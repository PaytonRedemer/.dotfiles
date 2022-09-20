from libqtile import bar, widget
from libqtile.config import Screen

def init_widgets():
    widget_list = [
        #widget.CurrentLayout(),
        widget.GroupBox(
            #highlight_method="text",
            #urgent_alert_method="text",
            rounded=False,
            fontsize=18,
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
    widget_list.append(widget.Systray())
    return widget_list

bar_size = 27
screen_border_color=["ff00ff", "000000", "ff00ff", "000000"]

screens = [
    Screen(top=bar.Bar(init_widgets_systray(), bar_size, border_color = screen_border_color)),
    Screen(top=bar.Bar(init_widgets(), bar_size, border_color = screen_border_color)),
    Screen(top=bar.Bar(init_widgets(), bar_size, border_color = screen_border_color)),
]