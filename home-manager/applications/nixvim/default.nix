{
    programs.nixvim = {
        enable = true;
        defaultEditor = true;

        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;

        globals.mapleader = " ";
        keymaps = [
            {
                mode = "n";
                key = "<C-h>";
                action = "<C-w>h";
            }
            {
                mode = "n";
                key = "yy";
                action = "yy";
            }
            {
                mode = "n";
                key = "<C-j>";
                action = "<C-w>j";
            }
            {
                mode = "n";
                key = "<C-k>";
                action = "<C-w>k";
            }
            {
                mode = "n";
                key = "<C-l>";
                action = "<C-w>l";
            }
            {
                mode = "n";
                key = "<C-Up>";
                action = ":resize -2<CR>";
            }
            {
                mode = "n";
                key = "<C-Down>";
                action = ":resize +2<CR>";
            }
            {
                mode = "n";
                key = "<C-Left>";
                action = ":vertical resize -2<CR>";
            }
            {
                mode = "n";
                key = "<C-Right>";
                action = ":vertical resize +2<CR>";
            }
            {
                mode = "n";
                key = "<S-l>";
                action = ":bnext<CR>";
            }
            {
                mode = "n";
                key = "<S-h>";
                action = ":bprevious<CR>";
            }
            {
                mode = "n";
                key = "<leader>h";
                action = "<cmd>nohlsearch<CR>";
            }
            {
                mode = "n";
                key = "<S-q>";
                action = "<cmd>bdelete!<CR>";
            }
            {
                mode = "n";
                key = "p";
                action = ''"+p'';
            }
            {
                mode = "n";
                key = "P";
                action = ''"+P'';
            }
            {
                mode = "v";
                key = "<";
                action = "<gv";
            }
            {
                mode = "v";
                key = ">";
                action = ">gv";
            }
            {
                mode = "v";
                key = "J";
                action = ":move '>+1<CR>gv-gv";
            }
            {
                mode = "v";
                key = "K";
                action = ":move '<-2<CR>gv-gv";
            }
            # {
            #     key = "]T";
            #     mode = "n";
            #     action = "todo-comments.jump_next";
            # }
            # {
            #     mode = "n";
            #     key = "[T";
            #     action = "todo-comments.jump_prev";
            # }
            # {
            #     mode = "n";
            #     key = "<leader>fT";
            #     action = "TodoTelescope";
            # }
            {
              mode = "n";
              key = "<leader>bn";
              action = ":bnext<CR>";
              options = {
                silent = true;
                desc = "Next buffer";
              };
            }
            {
              mode = "n";
              key = "<leader>bp";
              action = ":bprevious<CR>";
              options = {
                silent = true;
                desc = "Previous buffer";
              };
            }
            {
              mode = "n";
              key = "<leader>bd";
              action = ":bdelete<CR>";
              options = {
                silent = true;
                desc = "Delete current buffer";
              };
            }
          # Move buffer to right split
            {
              mode = "n";
              key = "<leader>ml";
              action = "<C-w>L";
              options = {
                silent = true;
                desc = "Move current buffer to right split";
              };
            }
            # Move buffer to top split
            {
              mode = "n";
              key = "<leader>mk";
              action = "<C-w>K";
              options = {
                silent = true;
                desc = "Move current buffer to top split";
              };
            }
            # Move buffer to bottom split
            {
              mode = "n";
              key = "<leader>mj";
              action = "<C-w>J";
              options = {
                silent = true;
                desc = "Move current buffer to bottom split";
              };
            }
            # Rotate splits
            {
              mode = "n";
              key = "<leader>mr";
              action = "<C-w>r";
              options = {
                silent = true;
                desc = "Rotate splits clockwise";
              };
            }
            # Rotate splits (reverse)
            {
              mode = "n";
              key = "<leader>mR";
              action = "<C-w>R";
              options = {
                silent = true;
                desc = "Rotate splits counter-clockwise";
              };
            }
            {
              mode = "n";
              key = "<Esc>";
              action = ":noh<CR><Esc>";
              options = {
                silent = true;
                desc = "Clear search highlighting";
              };
            }
            {
              key = "<leader>bo";
              mode = "n";
              action = ":%bdelete|e#|bdelete#<CR>";
              options = {
                silent = true;
                desc = "Close all buffers except current";
            };
      }
      ];

      extraConfigLua = ''
        -- Function to swap buffers between two splits
        function SwapBuffers()
          local current_buf = vim.fn.bufnr('%')
          vim.cmd('wincmd w')  -- Move to the next window
          local target_buf = vim.fn.bufnr('%')
          vim.cmd('buffer ' .. current_buf)
          vim.cmd('wincmd w')  -- Move back to the original window
          vim.cmd('buffer ' .. target_buf)
        end

        -- Set up a keymap to use this function
        vim.api.nvim_set_keymap('n', '<leader>ms', ':lua SwapBuffers()<CR>', {noremap = true, silent = true})
    '';
    };

}
