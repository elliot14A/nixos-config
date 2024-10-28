# modules/plugins/init.nix
{
  imports = [
    ./auto-session.nix
    ./neo-tree.nix
    ./telescope.nix
    ./comment.nix
    ./gitsigns.nix
    ./harpoon.nix
    ./indent-blankline.nix
    ./lsp.nix
    ./none-ls.nix
    ./notify.nix
    ./nvim-ufo.nix
    ./which-key.nix
    ./bufferline.nix
    ./cmp.nix
    ./treesitter.nix
    ./flash.nix
  ];

  programs.nixvim = {
    plugins = {
      web-devicons.enable = true;
      todo-comments.enable = true;
      ts-autotag.enable = true;
      ts-context-commentstring.enable = true;
      illuminate.enable = true;
      autoclose.enable = true;
      lualine.enable = true;
      fidget.enable = true;
    };
         # Add custom Lua configuration
  extraConfigLua = ''
    -- Set up autoformatting on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      callback = function()
        vim.lsp.buf.format({ async = false })
      end,
    })
  '';
  };
}
