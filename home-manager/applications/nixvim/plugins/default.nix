{
  programs.nixvim.plugins.web-devicons.enable = true;
  programs.nixvim.plugins.intellitab.enable = true;

  imports = [
    ./lsp/default.nix
    ./fidget.nix
    ./auto-session.nix
    ./autoclose.nix
    ./bufdelete.nix
    ./bufferline.nix
    ./comment.nix
    ./dashboard.nix
    ./dressing.nix
    ./flash.nix
    ./guess-indent.nix
    ./illuminate.nix
    ./indent-blankline.nix
    ./lazygit.nix
    ./lualine.nix
    ./nix.nix
    ./nvim-tree.nix
    ./oil.nix
    ./telescope.nix
    ./todo-comments.nix
    ./treesitter.nix
    ./which-key.nix
    ./wilder.nix
  ];
}
