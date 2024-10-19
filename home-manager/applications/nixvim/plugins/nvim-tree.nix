# modules/plugins/nvim-tree.nix
{
  programs.nixvim = {
    plugins.nvim-tree = {
      enable = true;
      disableNetrw = true;
      openOnSetup = true;
      openOnSetupFile = true;
      autoReloadOnWrite = true;
      sortBy = "case_sensitive";

      view = {
        width = 30;
        side = "left";
      };

      renderer = {
        groupEmpty = true;
        highlightGit = true;
        icons = {
          show = {
            file = true;
            folder = true;
            folderArrow = true;
            git = true;
          };
        };
      };

      filters = {
        dotfiles = false;
      };

      git = {
        enable = true;
        ignore = false;
      };

    };

    # NvimTree specific keymaps
    keymaps = [
      {
        mode = "n";
        key = "<leader>e";
        action = ":NvimTreeToggle<CR>";
        options = {
          silent = true;
          desc = "Toggle NvimTree";
        };
      }
      {
        mode = "n";
        key = "<C-n>";
        action = ":NvimTreeToggle<CR>";
        options = {
          silent = true;
          desc = "Toggle NvimTree (alternate)";
        };
      }
      {
        mode = "n";
        key = "<leader>o";
        action = ":NvimTreeFocus<CR>";
        options = {
          silent = true;
          desc = "Focus NvimTree";
        };
      }
    ];
  };
}
