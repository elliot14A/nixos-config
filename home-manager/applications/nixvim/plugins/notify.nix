{
  programs.nixvim = {
    plugins = {
      notify = {
        enable = true;
        settings = {
          icons = {
            DEBUG = "🔍";  
            ERROR = "❌";  
            INFO = "ℹ️";   
            TRACE = "🔗";  
            WARN = "⚠️";         
          };
          max_height = "__raw: function() return math.floor(vim.o.lines * 0.75) end";
          max_width = "__raw: function() return math.floor(vim.o.columns * 0.75) end";
          on_open = {
            __raw = ''
              function(win)
                vim.api.nvim_win_set_config(win, { zindex = 175 })
                vim.wo[win].conceallevel = 3
                local buf = vim.api.nvim_win_get_buf(win)
                if not pcall(vim.treesitter.start, buf, "markdown") then
                  vim.bo[buf].syntax = "markdown"
                end
                vim.wo[win].spell = false
              end
            '';
          };
        };
      };

      which-key = {
        enable = true;
        registrations = {
          "<leader>uD" = {
            action = "__raw: function() require('notify').dismiss { pending = true, silent = true } end";
            description = "Dismiss notifications";
          };
        };
      };

      treesitter = {
        enable = true;
        ensureInstalled = [ "markdown" ];
      };
    };

    extraConfigLua = ''
      -- Load nvim-notify
      vim.notify = require("notify")

      -- Configure nvim-notify
      require("notify").setup({
        -- Any additional setup options can be added here
      })

      -- Optional: Add a command to dismiss all notifications
      vim.api.nvim_create_user_command("DismissNotifications", function()
        require("notify").dismiss({ pending = true, silent = true })
      end, {})
    '';

  };
}
