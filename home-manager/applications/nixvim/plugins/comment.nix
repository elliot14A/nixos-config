{
  plugins.comment = {
    enable = true;
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
    preHook = "require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()";
  };

  maps = {
    normal = {
      "<leader>/" = {
        action = "require('Comment.api').toggle.linewise.current()";
        lua = true;
        desc = "Toggle comment line";
      };
    };
    visual = {
      "<leader>/" = {
        action = "require('Comment.api').toggle.linewise(vim.fn.visualmode())";
        lua = true;
        desc = "Toggle comment";
      };
    };
  };
}
