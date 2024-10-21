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
  ];

  programs.nixvim = {
    plugins = {
      web-devicons.enable = true;
      treesitter = {
        enable = true;
        settings = {
          auto_install = false;
          ensure_installed = [
            "go"
            "rust"
            "toml"
            "json"
            "javascript"
            "typescript"
            "gomod"
            "gowork"
            "gosum"
          ];
          indent = {
            enable = true;
          };
          highlight = {
            additional_vim_regex_highlighting = true;
            enable = true;
          };
          incremental_selection = {
            enable = true;
            keymaps = {
              init_selection = false;
              node_decremental = "grm";
              node_incremental = "grn";
              scope_incremental = "grc";
            };
          };
          parser_install_dir = {
            __raw = "vim.fs.joinpath(vim.fn.stdpath('data'), 'treesitter')";
          };
          sync_install = false;
        };
      };
      todo-comments.enable = true;
      ts-autotag.enable = true;
      ts-context-commentstring.enable = true;
      illuminate.enable = true;
      autoclose.enable = true;
      lualine.enable = true;
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
