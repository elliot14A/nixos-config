{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
let
  cfg = config.workstation.niri;
in
{
  options.workstation.niri.enable = lib.mkEnableOption "Niri-based workstation environment";

  config = lib.mkIf cfg.enable {
    programs.niri.enable = true;

    programs.yazi = {
      enable = true;
      settings = {
        yazi = {
          ratio = [
            1
            4
            3
          ];
          sort_by = "natural";
          sort_sensitive = true;
          sort_reverse = false;
          sort_dir_first = true;
          linemode = "none";
          show_hidden = true;
          show_symlink = true;
        };
      };
    };

    environment.systemPackages = with pkgs; [
      inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
      xwayland-satellite
      swayimg
      swaybg
      rose-pine-cursor
      pkgs.adwaita-icon-theme
      fuzzel
      gpu-screen-recorder
      gammastep
    ];

    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --remember-session --theme 'border=#61afef;text=#abb2bf;prompt=#61afef;time=#e5c07b;action=#5c6370;button=#61afef;container=#282c34;input=#98c379;greet=#e06c75;title=#61afef' --greeting 'Hello Elliot' --cmd niri-session";
          user = "greeter";
        };
      };
    };
  };
}
