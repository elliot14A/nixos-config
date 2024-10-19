{
  programs.nixvim.plugins.harpoon = {
    enable = true;
    keymaps = {
      addFile = "<leader>ha";
      toggleQuickMenu = "<leader>hm";
      navFile = {
        "1" = "<leader>h1";
        "2" = "<leader>h2";
        "3" = "<leader>h3";
        "4" = "<leader>h4";
        "5" = "<leader>h5";
        "6" = "<leader>h6";
      };
      navNext = "<leader>hn";
      navPrev = "<leader>hp";
    };
  };

  extraConfigLua = ''
    local harpoon = require("harpoon")

    -- Harpoon setup
    harpoon.setup({
      global_settings = {
        save_on_toggle = false,
        save_on_change = true,
        enter_on_sendcmd = false,
        tmux_autoclose_windows = false,
        excluded_filetypes = { "harpoon" },
        mark_branch = false,
      },
    })

    -- Additional keymaps not covered by the built-in options
    vim.keymap.set("n", "<leader>ht", function() require("harpoon.term").gotoTerminal(1) end, { desc = "Go to Harpoon terminal 1" })
    vim.keymap.set("n", "<leader>hT", function() require("harpoon.term").sendCommand(1, 1) end, { desc = "Send command to Harpoon terminal 1" })
    vim.keymap.set("n", "<leader>hc", function() require("harpoon.mark").clear_all() end, { desc = "Clear all Harpoon marks" })
  '';
}
