{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      servers = {};
    };

    lsp-lines = {
      enable = true;
    };

    neoconf = {
      enable = true;
    };

  };
}
