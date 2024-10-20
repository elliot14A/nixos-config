{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      servers = {};
    };

    lsp-lines = {
      enable = true;
    };

    lsp-kind = {
      enable = true;
    };
  };
}
