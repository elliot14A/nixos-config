{
    programs.nixvim = {
        enable = true;
        defaultEditor = true;

        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;
    };

    programs.nixvim.globals.mapleader = " ";

    # programs.nixvim.clipboard.register = "unnamedplus";
}
