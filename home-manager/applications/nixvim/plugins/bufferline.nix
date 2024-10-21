{
  programs.nixvim.plugins.bufferline = {
    enable = true;
    settings = {
      options = {
        mode = "buffers";
        numbers = "none";
        closable = true;
        separator_style = "thin";
        always_show_bufferline = false;
        diagnostics_indicator = ''
          function(count, level)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
          end
        '';
      };
    };
  };
}
