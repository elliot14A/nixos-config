# modules/plugins/init.nix
{
  imports = [
    ./nvim-tree.nix
  ];

  programs.nixvim = {
    plugins = {
      # Basic plugin enables
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
    };
  };
}
