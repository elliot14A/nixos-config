# modules/plugins/neo-tree.nix
{
  programs.nixvim = {
    plugins = {
      neo-tree = {
        enable = true;
        closeIfLastWindow = true;
        sources = ["filesystem" "buffers" "git_status"];
        defaultComponentConfigs = {
          indent = {
            withExpanders = true;
            expanderHighlight = "NeoTreeExpander";
          };
        };
        buffers.followCurrentFile.enabled = true;
        window = {
          width = 30;
          mappings = {
            "<space>" = "none";
            "o" = "open";
            "<cr>" = "open";
            "v" = "open_vsplit";
            "s" = "open_split";
            "C" = "close_node";
            "z" = "close_all_nodes";
            "Z" = "expand_all_nodes";
            "R" = "refresh";
            "a" = {
              command = "add";
              config = {
                show_path = "relative";
              };
            };
            "A" = "add_directory";
            "d" = "delete";
            "r" = "rename";
            "y" = "copy_to_clipboard";
            "x" = "cut_to_clipboard";
            "p" = "paste_from_clipboard";
            "[c" = "prev_git_modified";
            "]c" = "next_git_modified";
          };
        };
      };
    };

    extraConfigLua = ''
      vim.fn.sign_define("DiagnosticSignError", {text = " ", texthl = "DiagnosticSignError"})
      vim.fn.sign_define("DiagnosticSignWarn", {text = " ", texthl = "DiagnosticSignWarn"})
      vim.fn.sign_define("DiagnosticSignInfo", {text = " ", texthl = "DiagnosticSignInfo"})
      vim.fn.sign_define("DiagnosticSignHint", {text = "", texthl = "DiagnosticSignHint"})
    '';

    # NeoTree specific keymaps
    keymaps = [
      {
        mode = "n";
        key = "<leader>e";
        action = ":Neotree toggle<CR>";
        options = {
          silent = true;
          desc = "Toggle Explorer";
        };
      }
      {
        mode = "n";
        key = "<leader>o";
        action = ''
          function()
            if vim.bo.filetype == "neo-tree" then
              vim.cmd.wincmd "p"
            else
              vim.cmd.Neotree "focus"
            end
          end
        '';
        lua = true;
        options = {
          silent = true;
          desc = "Toggle Explorer Focus";
        };
      }
    ];

    autoCmd = [
      {
        event = "BufEnter";
        callback = {
          __raw = ''
            function()
              if package.loaded["neo-tree"] then
                return true
              else
                local stats = vim.loop.fs_stat(vim.api.nvim_buf_get_name(0))
                if stats and stats.type == "directory" then
                  vim.cmd("Neotree")
                  return true
                end
              end
            end
          '';
        };
        desc = "Open Neo-Tree on startup with directory";
      }
    ];
  };
}
