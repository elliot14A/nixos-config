{ ... }: 
{
  programs.starship.enable = true;
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      starship init fish | source 
    '';
    shellAliases = {
      z = "zellij"
    };
  };
}
