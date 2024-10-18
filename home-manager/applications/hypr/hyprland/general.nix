{ inputs, pkgs, ... }: {
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  wayland.windowManager.hyprland.systemd.variables = [ "--all" ];

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
  xdg.portal.config.common.default = "*";

  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";

    "$terminal" = "kitty";
    "$menu" = "fuzzel";
    "$fileManager" = "nemo";

    "windowrulev2" = [ "suppressevent maximize, class:.*" ];
  };

  wayland.windowManager.hyprland.settings.general = {
    gaps_in = 2;
    gaps_out = 5;

    border_size = 0;

    layout = "hy3"; # REQUIRES hy3 PLUGIN
  };
}
