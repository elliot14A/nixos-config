{ ... }: {
  wayland.windowManager.hyprland.settings.exec-once = [
    ''hyprctl setcursor "macOS" 32''
    ''wl-paste --type text --watch cliphist store''
    ''wl-paste --type image --watch cliphist store''
    ''nm-applet''
    ''blueman-applet''
    ''waybar''
  ];
}
