{ ... }: {
  wayland.windowManager.hyprland.settings.exec-once = [
    ''hyprctl setcursor "macOS" 32''
    ''wl-paste -t text --watch clipman store''
    ''wl-paste -t image --watch clipman store''
    ''nm-applet''
    ''blueman-applet''
    ''waybar''
  ];
}
