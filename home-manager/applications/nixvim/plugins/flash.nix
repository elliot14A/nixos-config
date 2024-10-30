{
  programs.nixvim = {
    plugins.flash = {
      enable = true;
    };

    # Add keymaps for flash
    keymaps = [
      {
        mode = "n";
        key = "s";
        action = "<cmd>lua require('flash').jump()<cr>";
        options = {
          desc = "Flash";
          silent = true;
        };
      }
      {
        mode = ["n" "x" "o"];
        key = "S";
        action = "<cmd>lua require('flash').treesitter()<cr>";
        options = {
          desc = "Flash Treesitter";
          silent = true;
        };
      }
      {
        mode = ["o"];
        key = "r";
        action = "<cmd>lua require('flash').remote()<cr>";
        options = {
          desc = "Remote Flash";
          silent = true;
        };
      }
      {
        mode = ["o" "x"];
        key = "R";
        action = "<cmd>lua require('flash').treesitter_search()<cr>";
        options = {
          desc = "Flash Treesitter Search";
          silent = true;
        };
      }
    ];
  };
}
