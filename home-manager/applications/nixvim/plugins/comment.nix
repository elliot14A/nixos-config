{
  programs.nixvim.plugins.comment = {
    enable = true;
    settings = {
        mappings = {
            basic = true;
            extra = true;
        };
        toggler = {
            line = "gcc";
            block = "gbc";
        };
        opleader = {
            line = "gc";
            block = "gb";
        };
        extra = {
            above = "gcO";
            below = "gco";
            eol = "gcA";
        };
    };
  };
}
