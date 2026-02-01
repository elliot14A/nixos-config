{
  config,
  lib,
  ...
}:
let
  cfg = config.workstation.ssh;
in
{
  options.workstation.ssh.enable = lib.mkEnableOption "Default SSH configuration";
  config = lib.mkIf cfg.enable {
    services.openssh = {
      enable = true;
      ports = [ 22 ];
      settings = {
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
        PermitRootLogin = "no";
        AllowUsers = [ "kiwi" ];
      };
    };
    users.users."kiwi".openssh.authorizedKeys.keys = [
    ];
  };
}
