{
  programs.nixvim.plugins.harpoon = {
    enable = true;
    keymaps = {
      addFile = "<leader>ha";
      toggleQuickMenu = "<leader>hm";
      navFile = {
        "1" = "<leader>h1";
        "2" = "<leader>h2";
        "3" = "<leader>h3";
        "4" = "<leader>h4";
        "5" = "<leader>h5";
        "6" = "<leader>h6";
      };
      navNext = "<leader>hn";
      navPrev = "<leader>hp";
    };
  };
}
