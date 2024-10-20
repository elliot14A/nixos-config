{
  programs.nixvim = {
    plugins = {
      notify = {
        enable = true;
        icons = {
            debug = "🔍";  
            error = "❌";  
            info = "ℹ️";   
            trace = "🔗";  
            warn = "🚨";         
          };
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
