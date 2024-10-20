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
  ];

  programs.nixvim = {

    plugins = {
      # Basic plugin enables
      web-devicons.enable = true;
      lualine.enable = true;
      treesitter.enable = true;
      markdown-preview.enable = true;

    };
  };
}
