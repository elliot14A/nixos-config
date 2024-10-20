# modules/plugins/init.nix
{
  imports = [
    ./neo-tree.nix
    ./telescope.nix
    ./comment.nix
    ./gitsigns.nix
    ./harpoon.nix
    ./indent-blankline.nix
    ./lspconfig.nix
  ];

  programs.nixvim = {

    plugins = {
      # Basic plugin enables
      web-devicons.enable = true;
      lualine.enable = true;
      treesitter.enable = true;

    };
  };
}
