{
  programs.nixvim.plugins.indent-blankline = {
    enable = true;
    settings = {
        indent = {
        char = "▏";
        };
        scope = {
        showStart = false;
        showEnd = false;
        };
        exclude = {
        buftypes = [
            "nofile"
            "prompt"
            "quickfix"
            "terminal"
        ];
        filetypes = [
            "dashboard"
            "help"
            "neo-tree"
            "neogitstatus"
            "notify"
            "startify"
            "toggleterm"
            "Trouble"
        ];
        };
    };
        maps.normal."<leader>u|" = {
            action = "<cmd>IBLToggle<cr>";
            desc = "Toggle indent guides";
        };
    };

}
