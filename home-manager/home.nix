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
    pkgs.libreoffice
    pkgs.playerctl
    pkgs.k9s
    pkgs.postman

    pkgs.zoxide       
    pkgs.delta        
    pkgs.bottom       
    pkgs.procs        
    pkgs.du-dust      
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
    pkgs.go

    # Fonts
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; })

    (pkgs.google-cloud-sdk.withExtraComponents [
      pkgs.google-cloud-sdk.components.cloud-build-local
      pkgs.google-cloud-sdk.components.gke-gcloud-auth-plugin
      pkgs.google-cloud-sdk.components.kubectl
    ])

    (
      pkgs.python3.withPackages(ps: with ps; [
        pip
        setuptools
      ])
    )

  ];

  programs.home-manager.enable = true;

  # Git configuration
  programs.git = {
    enable = true;
    userName = "elliot";
    userEmail = "elliot@nixos.home";
  };


}
