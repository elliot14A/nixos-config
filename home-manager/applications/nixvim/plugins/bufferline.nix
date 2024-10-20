{
  programs.nixvim.plugins.bufferline = {
    enable = true;
    settings = {
      options = {
        mode = "buffers";
        numbers = "none";
        closable = true;
        separator_style = "thin";
      };
    };
  };
}
