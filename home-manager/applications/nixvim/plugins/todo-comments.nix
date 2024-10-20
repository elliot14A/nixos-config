{
  programs.nixvim = {
    plugins.todo-comments = {
      enable = true;
    };

    # Keymaps for todo-comments
    keymaps = {
      normal = {
        "]T" = {
          action = "require('todo-comments').jump_next()";
          desc = "Next TODO comment";
          lua = true;
        };
        "[T" = {
          action = "require('todo-comments').jump_prev()";
          desc = "Previous TODO comment";
          lua = true;
        };
      };
    };
  };
}
