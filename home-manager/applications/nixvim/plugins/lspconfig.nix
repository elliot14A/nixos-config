{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      servers = {
        rust-analyzer
        gopls
        go-imports
      };
    };

    lsp-lines = {
      enable = true
    };

    neoconf = {
      enable = true;
    };

    lspconfig = {
      enable = true;
    };

  };
}
