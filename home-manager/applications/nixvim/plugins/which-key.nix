{
  programs.nixvim = {
    plugins.which-key = {
      enable = true;
      settings = {
        plugins = {
          marks = true;
          registers = true;
          spelling = {
            enabled = true;
            suggestions = 20;
          };
          presets = {
            operators = true;
            motions = true;
            text_objects = true;
            windows = true;
            nav = true;
            z = true;
            g = true;
          };
        };
        icons = {
          breadcrumb = "»";
          separator = "➜";
          group = "+";
        };
        key_labels = {
          # Replace operators with key_labels
          gc = "Comments";
        };
        motions = {
          count = true;
        };
        popup = {
          # Replace popup_mappings with popup
          scroll_down = "<c-d>";
          scroll_up = "<c-u>";
        };
        window = {
          border = "single";
          position = "bottom";
          margin = { top = 1; right = 0; bottom = 1; left = 0; };
          padding = { top = 1; right = 2; bottom = 1; left = 2; };
          winblend = 0;
        };
        ignore_missing = false;
        hidden = [ "<silent>" "<cmd>" "<Cmd>" "<CR>" "^:" "^ " "^call " "^lua " ];
        show_help = true;
        show_keys = true;
        triggers_blacklist = {
          i = [ "j" "k" ];
          v = [ "j" "k" ];
        };
        disable = {
          buftypes = [ "prompt" "quickfix" ];
          filetypes = [ "TelescopePrompt" ];
        };
      };
    };
  };
}
