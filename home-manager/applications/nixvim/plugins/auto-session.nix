{
  programs.nixvim = {
  plugins.auto-session = {
      enable = true;
      settings = {
        enabled = true;
        auto_create = true;
        auto_restore = true;
        auto_save = true;
        auto_restore_last_session = false;
        log_level = "info";
        root_dir = {
          __raw = "vim.fn.stdpath 'data' .. '/sessions/'";
        };
        use_git_branch = true;
        bypass_save_filetypes = [ "gitcommit" "gitrebase" ];
        session_lens = {
          load_on_setup = true;
          theme_conf = {
            border = true;
            winblend = 10;
          };
        };
        cwd_change_handling = {
          __raw = ''
            {
              restore_upcoming_session = true,
              pre_cwd_changed_hook = nil,
              post_cwd_changed_hook = nil,
            }
          '';
        };
      };
    };
  };
}
