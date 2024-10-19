# modules/plugins/init.nix
{
  imports = [
    # We'll add individual plugin configurations here
  ];

  programs.nixvim = {
    plugins = {
      # Basic plugin enables
      nvim-tree.enable = true;
      telescope.enable = true;
      lualine.enable = true;
      gitsigns.enable = true;
      treesitter.enable = true;

      # LSP
      lsp = {
        enable = true;
        servers = {
          # We'll add language servers here
        };
      };

      # Autocompletion
      nvim-cmp = {
        enable = true;
        sources = [
          { name = "nvim_lsp"; }
          { name = "buffer"; }
          { name = "path"; }
        ];
      };
    };
  };
}
