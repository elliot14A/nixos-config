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
        ];
    };

}
