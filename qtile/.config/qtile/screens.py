from libqtile import bar
from libqtile.config import Screen
from widgets import init_widgets, init_widgets_systray
from colors import colors


bar_size = 27

screens = [
    Screen(top=bar.Bar(init_widgets_systray(), bar_size, background=colors["background"])),
    Screen(top=bar.Bar(init_widgets(), bar_size, background=colors["background"])),
    Screen(top=bar.Bar(init_widgets(), bar_size, background=colors["background"])),
]
