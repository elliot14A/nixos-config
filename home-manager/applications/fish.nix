{ ... }: 
{
  programs.starship.enable = true;
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      starship init fish | source 
    '';
    # loginShellInit = ''
    #   # Any login shell initialization can go here
    # '';
    shellAliases = {
      z = "zellij"
    };
  };
}
