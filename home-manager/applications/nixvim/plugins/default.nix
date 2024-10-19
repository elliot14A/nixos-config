# modules/plugins/init.nix
{
  imports = [
    ./neo-tree.nix
    ./telescope.nix
    ./comment.nix
  ];

  programs.nixvim = {

    plugins = {
      # Basic plugin enables
      web-devicons.enable = true;
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
