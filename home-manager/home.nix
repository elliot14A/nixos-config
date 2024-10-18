{ inputs, pkgs, ... }:
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
    pkgs.nixd
    pkgs.nodejs

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
