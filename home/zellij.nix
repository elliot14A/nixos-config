{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.zellij = {
    enable = true;
  };

  # Symlink the zellij config from the config directory
  xdg.configFile."zellij/config.kdl".source = ../config/zellij/config.kdl;
}
