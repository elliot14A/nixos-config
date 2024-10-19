# modules/plugins/init.nix
{
  imports = [
    ./nvim-tree.nix
    ./telescope.nix
  ];

  programs.nixvim = {
    plugins = {
      # Basic plugin enables
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
