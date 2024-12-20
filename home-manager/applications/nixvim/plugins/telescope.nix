# modules/plugins/telescope.nix
{
  programs.nixvim = {
    plugins = {
      telescope = {
        enable = true;
        extensions = {
          fzf-native = {
            enable = true;
            settings = {
              override_generic_sorter = true;
              override_file_sorter = true;
              case_mode = "smart_case";
            };
          };
        };
        settings.defaults = {
          fileIgnorePatterns = [ "^.git/" "/%.git/" ];
          promptPrefix = "🔍 ";
          selectionCaret = "➤ ";
          mappings = {
            i = {
              "<C-j>" = "move_selection_next";
              "<C-k>" = "move_selection_previous";
            };
          };
          layout_config = {
            horizontal = {
              prompt_position = "top";
              preview_width = 0.55;
            };
            vertical = {
              mirror = false;
            };
            width = 0.87;
            height = 0.80;
            preview_cutoff = 120;
          };
        };
      };
    };

    extraConfigLua = ''
      local telescope = require('telescope')
      local actions = require('telescope.actions')
      local builtin = require('telescope.builtin')

      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<CR>"] = actions.select_default + actions.center,
              ["<C-x>"] = actions.select_horizontal,
              ["<C-v>"] = actions.select_vertical,
            },
            n = {
              ["q"] = actions.close,
            },
          },
        },
      })

      -- Functions to open files in split mode
      _G.find_files_in_split = function()
        builtin.find_files({ attach_mappings = function(_, map)
          map('i', '<CR>', actions.select_horizontal)
          return true
        end})
      end

      _G.find_files_in_vsplit = function()
        builtin.find_files({ attach_mappings = function(_, map)
          map('i', '<CR>', actions.select_vertical)
          return true
        end})
      end
    '';

    # Telescope specific keymaps
    keymaps = [
      {
        mode = "n";
        key = "<leader>ff";
        action = ":Telescope find_files<CR>";
        options = {
          silent = true;
          desc = "Find files";
        };
      }
      {
        mode = "n";
        key = "<leader>fg";
        action = ":Telescope live_grep<CR>";
        options = {
          silent = true;
          desc = "Live grep";
        };
      }
      {
        mode = "n";
        key = "<leader>fb";
        action = ":Telescope buffers<CR>";
        options = {
          silent = true;
          desc = "Find buffers";
        };
      }
      {
        mode = "n";
        key = "<leader>fh";
        action = ":Telescope help_tags<CR>";
        options = {
          silent = true;
          desc = "Help tags";
        };
      }
      {
        mode = "n";
        key = "<leader>fo";
        action = ":Telescope oldfiles<CR>";
        options = {
          silent = true;
          desc = "Old files";
        };
      }
      {
        mode = "n";
        key = "<leader>fm";
        action = ":Telescope marks<CR>";
        options = {
          silent = true;
          desc = "Find marks";
        };
      }
      {
        mode = "n";
        key = "<leader>fc";
        action = ":Telescope grep_string<CR>";
        options = {
          silent = true;
          desc = "Find word under cursor";
        };
      }
      {
        mode = "n";
        key = "<leader>fk";
        action = ":Telescope keymaps<CR>";
        options = {
          silent = true;
          desc = "Find keymaps";
        };
      }
      {
        mode = "n";
        key = "<leader>fr";
        action = ":Telescope registers<CR>";
        options = {
          silent = true;
          desc = "Find registers";
        };
      }
      {
        mode = "n";
        key = "<leader>ft";
        action = ":Telescope colorscheme<CR>";
        options = {
          silent = true;
          desc = "Find themes";
        };
      }
      {
        mode = "n";
        key = "<leader>f/";
        action = ":Telescope current_buffer_fuzzy_find<CR>";
        options = {
          silent = true;
          desc = "Find words in current buffer";
        };
      }
      {
        mode = "n";
        key = "<leader>fs";
        action = ":lua find_files_in_split()<CR>";
        options = {
          silent = true;
          desc = "Find files (split mode)";
        };
      }
      {
        mode = "n";
        key = "<leader>fvs";
        action = ":lua find_files_in_vsplit()<CR>";
        options = {
          silent = true;
          desc = "Find files (vertical split mode)";
        };
      }
    ];
  };
}
