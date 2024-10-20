{
  programs.nixvim = {
  plugins.auto-session = {
      enable = true;
      settings = {
        auto_create = true;
        auto_restore = true;
        auto_restore_last_session = false;
        auto_save = true;
        bypass_save_filetypes = [ 
          "gitcommit" 
          "gitrebase" 
        ];
        cwd_change_handling = true;
        enabled = true;
        log_level = "info";
        root_dir = "/home/elliot/.local/share/nvim/sessions/";
        session_lens = {
          load_on_setup = true;
          theme_conf = {
            border = true;
            winblend = 10;
          };
        };
        use_git_branch = true;
      };
    };
  };
}
