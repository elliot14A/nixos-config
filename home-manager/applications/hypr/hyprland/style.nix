{ ... }: {
  wayland.windowManager.hyprland.settings.decoration = {
    rounding = 2;
    blur = {
      enabled = false;
    };
    active_opacity = 1.0;
    inactive_opacity = 1.0;
    fullscreen_opacity = 1.0;
    drop_shadow = "no";
    shadow_range = 4;
    shadow_render_power = 3;
    "col.shadow" = "rgba(1a1a1aee)";
  };
}
