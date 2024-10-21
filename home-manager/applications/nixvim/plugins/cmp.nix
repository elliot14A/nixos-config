{
  programs.nixvim = {
    plugins = {
      cmp = {
        enable = true;
        settings = {
          sources = [
            { name = "nvim_lsp"; }
            { name = "luasnip"; }
            { name = "buffer"; }
            { name = "path"; }
          ];
          snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
          mapping = {
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-e>" = "cmp.mapping.close()";
            "<C-n>" = "cmp.mapping.select_next_item()";
            "<C-p>" = "cmp.mapping.select_prev_item()";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
          };
        };
      };
      luasnip.enable = true;
    };
  };
}
