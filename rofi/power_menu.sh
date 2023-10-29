rofi -show power-menu \
    -modi "power-menu:~/Documents/GitHub/rofi/rofi-power-menu/rofi-power-menu --choices=shutdown/reboot/logout/suspend --confirm=reboot/suspend" \
    -no-fixed-num-lines \
    -no-sidebar-mode \
    -config "$HOME/.config/rofi/themes/gruvbox.rasi"
