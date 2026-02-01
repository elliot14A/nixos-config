{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.home-manager.enable = true;

  home = {
    username = "kiwi";
    homeDirectory = lib.mkForce "/home/kiwi";
    stateVersion = "25.05";
  };

  programs.git.enable = true;

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.btop = {
    enable = true;
    settings = {
      color_theme = "tokyo-night";
      theme_background = true;
      truecolor = true;
    };
  };

  xdg.configFile = {
    "starship.toml".source = ../config/starship/starship.main.toml;
  };

}
