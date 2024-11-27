{
  programs.nixvim.plugins.avante = {
    enable = true;
    settings = {
      provider = "copilot";
      copilot = {
        model = "claude-3.5-sonnet";
      };
    };
  }; 
}
