{
  programs.nixvim = {
    plugins.feline = {
      enable = true;
      settings = {
        components = {
          active = [
            [
              {
                provider = "vi_mode";
                hl = {
                  name = "NeovimModeHLGroup";
                  fg = "skyblue";
                  bg = "darkblue";
                  style = "bold";
                };
              }
              {
                provider = "file_info";
              }
            ]
            [
              {
                provider = "diagnostic_errors";
              }
              {
                provider = "diagnostic_warnings";
              }
              {
                provider = "diagnostic_hints";
              }
              {
                provider = "diagnostic_info";
              }
            ]
            [
              {
                provider = "git_branch";
              }
              {
                provider = "line_percentage";
              }
              {
                provider = "position";
              }
            ]
          ];
        };
      };
    };
  };
}
