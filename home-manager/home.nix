{ inputs, config, pkgs, ... }:

let
  gruvboxDark = {
    bg0 = "#282828";
    bg1 = "#3c3836";
    bg2 = "#504945";
    bg3 = "#665c54";
    bg4 = "#7c6f64";
    fg0 = "#fbf1c7";
    fg1 = "#ebdbb2";
    fg2 = "#d5c4a1";
    fg3 = "#bdae93";
    fg4 = "#a89984";
    red = "#cc241d";
    green = "#98971a";
    yellow = "#d79921";
    blue = "#458588";
    purple = "#b16286";
    aqua = "#689d6a";
    orange = "#d65d0e";
  };
in
{
  imports = [
    ./applications/_imports.nix
  ];

  nixpkgs = { config = { allowUnfree = true; }; };

  home.username = "elliot";
  home.homeDirectory = "/home/elliot";

  home.stateVersion = "24.05";

  home.packages =  [
    # Hyprland-related packages
    pkgs.dunst
    pkgs.swww
    pkgs.grim
    pkgs.slurp
    pkgs.wl-clipboard
    pkgs.brightnessctl
    pkgs.pamixer
    pkgs.networkmanagerapplet
    pkgs.blueman
    pkgs.polkit-kde-agent
    pkgs.gcc

    pkgs.fish
    pkgs.starship
    pkgs.fzf

    pkgs.git

    pkgs.ranger
    pkgs.xfce.thunar

    pkgs.htop
    pkgs.neofetch

    pkgs.mpv
    pkgs.pavucontrol

    pkgs.light
    pkgs.mpc_cli
    pkgs.ncmpcpp

    pkgs.tree
    pkgs.libGL
    pkgs.libGLU
    pkgs.eza
    inputs.zen-browser.packages."${pkgs.system}".specific
    pkgs.lazygit
    pkgs.lazydocker
    pkgs.btop
    pkgs.fzf
    pkgs.ripgrep
    pkgs.apple-cursor
    pkgs.zed-editor
    pkgs.libclang
    pkgs.ffmpeg
    pkgs.rustup
    pkgs.lld

    # Fonts
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })
  ];

  programs.home-manager.enable = true;

  # Git configuration
  programs.git = {
    enable = true;
    userName = "elliot";
    userEmail = "elliot@nixos.home";
  };


}
