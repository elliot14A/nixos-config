{
  programs.nixvim = {
    plugins.nvim-tree = {
      enable = true;
      disableNetrw = true;
      openOnSetup = true;
      openOnSetupFile = true;
      autoReloadOnWrite = true;
      sortBy = "case_sensitive";

      view = {
        width = 30;
        side = "left";
      };

      renderer = {
        groupEmpty = true;
        highlightGit = true;
        icons = {
          show = {
            file = true;
            folder = true;
            folderArrow = true;
            git = true;
          };
        };
      };

      filters = {
        dotfiles = false;
      };

      git = {
        enable = true;
        ignore = false;
      };

      actions = {
        openFile = {
          quitOnOpen = true;
        };
      };
    };
  };
}
