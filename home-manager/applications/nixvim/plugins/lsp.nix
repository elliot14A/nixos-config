{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      servers = {};
    };

    lsp-lines = {
      enable = true;
    };

    lspkind = {
      enable = true;
    };
  };
}
