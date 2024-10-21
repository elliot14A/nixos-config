{
  programs.nixvim.opts = {
     number = true;
     relativenumber = true;
     expandtab = true;
     tabstop = 2;
     softtabstop = 2;
     smartindent = true;
     wrap = false;
     swapfile = false;
     backup = false;
     undofile = true;
     hlsearch = true;
     incsearch = true;
     hidden = true;
     termguicolors = true;
     scrolloff = 8;
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
