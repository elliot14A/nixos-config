{
  programs.nixvim.opts = {
     number = true;
     relativenumber = true;
     shiftwidth = 2;
     expandtab = true;
     tabstop = 2;
     softtabstop = 2;
     smartindent = true;
     wrap = false;
     swapfile = false;
     backup = false;
     undofile = true;
     hlsearch = false;
     incsearch = true;
     termguicolors = true;
     scrolloff = 8;
     signcolumn = "yes";
     clipboard = "unnamedplus";
     updatetime = 50;
         sessionoptions = [
        "blank"
        "buffers"
        "curdir"
        "folds"
        "help"
        "tabpages"
        "winsize"
        "winpos"
        "terminal"
        "localoptions"  # Add this line
      ];
  };
}
