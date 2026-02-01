{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../../../modules/baseline.nix
    ../../../modules/niri.nix
    ../../../modules/nvidia.nix
    inputs.agenix.nixosModules.default
  ];

  age.secrets.github-ssh-key = {
    file = ../../../home/secrets/keys/github-ssh-key.age;
    path = "/home/kiwi/.ssh/github_ed25519";
    owner = "kiwi";
    group = "users";
    mode = "0600";
  };

  age.identityPaths = [ "/home/kiwi/.config/sops/age/keys.txt" ];

  networking.hostName = "kiwi";
  hardware.cpu.intel.updateMicrocode = true;

  workstation.baseline.enable = true;
  workstation.niri.enable = true;
  workstation.nvidia.enable = true;

  systemd.services.micmute-led-off = {
    description = "Turn off micmute LED at boot";
    wantedBy = [ "multi-user.target" ];
    after = [ "sysinit.target" ];

    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.bash}/bin/bash -c 'echo 0 > /sys/class/leds/platform::micmute/brightness || true'";
    };
  };

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };

  environment.systemPackages = with pkgs; [
    v4l-utils
  ];
}
