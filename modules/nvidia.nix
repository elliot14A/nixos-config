{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.workstation.nvidia;
in
{
  options.workstation.nvidia = {
    enable = lib.mkEnableOption "NVIDIA GPU support";
  };

  config = lib.mkIf cfg.enable {
    # Enable OpenGL
    hardware.graphics = {
      enable = true;
    };

    # Load nvidia driver for Xorg and Wayland
    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      open = true;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };

  };
}
