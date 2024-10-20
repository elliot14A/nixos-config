{ pkgs, ... }:

{
  programs.nixvim = {
    plugins = {
      none-ls = {
        enable = true;
        sources = {
          # Add your none-ls sources here, for example:
          # code_actions.gitsigns = true;
          # diagnostics.eslint = true;
          # formatting.prettier = true;
        };
        settings = {
          debug = false;
          log_level = "warn";
          debounce = 250;
          default_timeout = 5000;
          diagnostics_format = "[#{c}] #{m} (#{s})";
          fallback_severity = "vim.diagnostic.severity.ERROR";
          update_in_insert = false;
          border = "rounded";
          cmd = [ "nvim" ];
          notify_format = "[null-ls] %s";
          root_dir = ''
            require('null-ls.utils').root_pattern('.null-ls-root', 'Makefile', '.git')
          '';
          temp_dir = "/tmp/null-ls";
          diagnostic_config = {
            underline = true;
            virtual_text = true;
            signs = true;
          };
          on_attach = ''
            function(client, bufnr)
              -- You can add your on_attach logic here
              -- For example, to integrate with lsp-format:
              -- require('lsp-format').on_attach(client, bufnr)
            end
          '';
          on_init = ''
            function(client, initialize_result)
              print("null-ls initialized")
            end
          '';
          on_exit = ''
            function(client, code, signal)
              print("null-ls exited")
            end
          '';
          should_attach = ''
            function(bufnr)
              local bufname = vim.api.nvim_buf_get_name(bufnr)
              return not vim.startswith(bufname, "git://")
            end
          '';
        };
      };

    };

    extraConfigLua = ''
      -- Configure mason-null-ls
      require("mason-null-ls").setup({
        ensure_installed = {},
        handlers = {},
      })

      -- Add keymapping for NullLsInfo
      vim.keymap.set('n', '<Leader>lI', '<Cmd>NullLsInfo<CR>', {
        desc = "Null-ls information",
        cond = function() return vim.fn.exists(":NullLsInfo") > 0 end,
      })

      -- Load mason-null-ls after mason
      require("astrocore").on_load("mason.nvim", "mason-null-ls.nvim")
    '';

  };
}
