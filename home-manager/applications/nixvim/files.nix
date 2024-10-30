{
  programs.nixvim.files = {
    "ftplugin/nix.lua" = {
      opts = {
        expandtab = true;
        shiftwidth = 2;
        tabstop = 2;
      };
    };
    "ftplugin/ts.lua" = {
      opts = {
        expandtab = true;
        shiftwidth = 2;
        tabstop = 2;
      };
    };
    "ftplugin/tsx.lua" = {
      opts = {
        expandtab = true;
        shiftwidth = 2;
        tabstop = 2;
      };
    };
    "ftplugin/json.lua" = {
      opts = {
        expandtab = true;
        shiftwidth = 4;
        tabstop = 4;
      };
    };
    "ftplugin/go.lua" = {
      opts = {
        expandtab = true;
        shiftwidth = 4;
        tabstop = 4;
      };
    };
    "ftplugin/rust.lua" = {
      opts = {
        expandtab = true;
        shiftwidth = 4;
        tabstop = 4;
      };
    };
  };
}
