{
  pkgs,
  ...
}:

{

  home = {
    username = "kiwi";
    homeDirectory = "/home/kiwi";
    stateVersion = "25.11";
  };

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    settings = {
      user = {
        email = "akshithkatkuri14@gmail.com";
        name = "elliot14A@nixos";
      };
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
    };
  };

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "*" = {
        # Default SSH client options you want to keep
        serverAliveInterval = 60;
        serverAliveCountMax = 3;
      };
      "github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/github_ed25519";
        identitiesOnly = true;
      };
    };
  };

  home.packages = with pkgs; [
    opencode
  ];

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.btop = {
    enable = true;
    settings = {
      color_theme = "onedark";
      theme_background = true;
      truecolor = true;
    };
  };

  xdg.configFile = {
    "starship.toml".source = ../config/starship/starship.main.toml;
    "ghostty/config".source = ../config/ghostty/onedark.ghostty;
    "eza/theme.yml".source = ../config/eza/eza.main.yml;
    "fuzzel/fuzzel.ini".source = ../config/fuzzel/onedark.fuzzel.ini;
    "fastfetch/config.jsonc".source = ../config/fastfetch/main.fastfetch;
    "opencode/opencode.json".source = ../config/opencode/opencode.json;
    "noctalia/settings.json".source = ../config/noctalia/settings.json;
    "wallpapers".source = ../config/wallpapers;
  };

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };
  };
}
