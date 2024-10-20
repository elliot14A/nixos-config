{
  programs.nixvim.plugins.indent-blankline = {
    enable = true;
    settings = {
        indent = {
        char = "▏";
        };
        scope = {
          enabled = true;
          show_start = false;
          show_end = false;
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
  };
}
