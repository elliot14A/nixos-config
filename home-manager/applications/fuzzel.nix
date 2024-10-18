{ ... }: {
  programs.fuzzel.enable = true;
  programs.fuzzel.settings = {
    main = {
      font = "FiraCode Nerd Font:size=16";
      line-height = 30;
      prompt = "-> ";
      layer = "overlay";
      lines = 10;
      icon-theme = "WhiteSur";
      horizontal-pad = 10;
      vertical-pad = 10;
      inner-pad = 6;
      filter-desktop = true;
      image-size-ratio = 0.5;
      terminal = "kitty";
      fields = "name,exec,filename";
      placeholder = "Search...";
      sort-result = false;
      match-mode = "exact";
      dpi-aware = false;
    };
    colors = {
      background = "282828aa";  # bg0 with alpha
      text = "ebdbb2ff";        # fg1
      prompt = "b8bb26ff";      # green
      input = "ebdbb2ff";       # fg1
      match = "fb4934ff";       # red
      selection = "504945ff";   # bg2
      selection-match = "b8bb26ff"; # green
      selection-text = "fbf1c7ff";  # fg0
      border = "b8bb26ff";      # green
      placeholder = "928374ff"; # gray
      count = "928374ff";       # gray
    };
    border = {
      radius = 6;
      width = 2;
    };
    key-bindings = {
      prev-with-wrap = "Up";
      next-with-wrap = "Down";
      prev = "None";
      next = "None";
    };
  };
}
