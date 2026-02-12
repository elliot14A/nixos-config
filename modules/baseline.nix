{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
let
  cfg = config.workstation.baseline;
in
{
  options.workstation.baseline.enable = lib.mkEnableOption "Baseline workstation configuration";

  config = lib.mkIf cfg.enable {
    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

    nixpkgs.config.allowUnfree = true;

    boot = {
      loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
      };
      kernelPackages = pkgs.linuxPackages_latest;
      kernelModules = [ "uvcvideo" ];
    };

    hardware.enableAllFirmware = true;

    networking.networkmanager.enable = true;

    nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    time.timeZone = "America/Chicago";

    i18n.defaultLocale = "en_US.UTF-8";
    console = {
      font = "Lat2-Terminus16";
      keyMap = "us";
    };

    users.users.kiwi = {
      isNormalUser = true;
      shell = pkgs.fish;
      extraGroups = [
        "wheel"
        "networkmanager"
        "sound"
        "video"
        "audio"
        "libvirtd"
      ];
    };

    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Experimental = true;
          FastConnectable = false;
        };
        Policy = {
          AutoEnable = true;
        };
      };
    };

    fonts = {
      enableDefaultPackages = true;
      packages = with pkgs; [
        nerd-fonts.jetbrains-mono
        inter
      ];
      fontconfig = {
        enable = true;
        defaultFonts = {
          sansSerif = [
            "Inter"
            "Noto Sans"
          ];
          serif = [ "Noto Serif" ];
          monospace = [ "JetBrainsMono Nerd Font" ];
        };
      };
      fontDir.enable = true;
    };

    programs.firefox.enable = true;
    programs.dconf.enable = true;
    programs.neovim.enable = true;
    programs.fish.enable = true;
    environment.pathsToLink = [ "/share/fish" ];

    programs.virt-manager.enable = false;
    virtualisation = {
      libvirtd = {
        enable = true;
        qemu.swtpm.enable = true;
      };
      spiceUSBRedirection.enable = true;
    };

    environment.systemPackages = with pkgs; [
      wget
      git
      blueman
      curl
      tree
      eza
      ghostty
      fastfetch
      starship
      lazyssh
      lazygit
      nixfmt
      blueman
      ffmpeg
      whois
      parted
      usbutils
      smartmontools
      pciutils
      file
      mediawriter
      rustup
      cargo
      gcc
      nodejs
      bun
      python3
      jq
      ripgrep
      fd
      bat
      fzf
      vlc
    ];

    services = {
      tailscale.enable = true;
      qemuGuest.enable = true;
      spice-vdagentd.enable = true;
      libinput.enable = true;
      upower.enable = true;
      power-profiles-daemon.enable = true;
      pipewire = {
        enable = true;
        pulse.enable = true;
        alsa.enable = true;
      };
    };

    services.flatpak.enable = true;

    systemd.services.flatpak-repo = {
      wantedBy = [ "multi-user.target" ];
      path = [ pkgs.flatpak ];
      script = ''
        flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
      '';
    };

    xdg.portal.enable = true;
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

    system.stateVersion = "25.11";
  };
}
