{ pkgs, ... }:

{
  programs.fish = {
    enable = true;

    shellInit = ''
      # Set default environment variables
      set -gx EDITOR nvim
      set -gx VISUAL nvim
      set -gx TERM xterm-256color
      
      # Add custom paths
      fish_add_path $HOME/.local/bin
      
      # Initialize starship
      starship init fish | source

      # Configure FZF keybindings
      set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'
      set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
      set -gx FZF_ALT_C_COMMAND 'fd --type d --hidden --follow --exclude .git'

      # Load completions 
      for p in $NIX_PROFILES
        fish_add_path $p/share/fish/vendor_completions.d
        fish_add_path $p/share/fish/vendor_functions.d
        fish_add_path $p/share/fish/vendor_conf.d
      end
    '';

    interactiveShellInit = ''
      # Disable greeting
      set -g fish_greeting ""
    '';

    shellAliases = {
      # System
      l = "eza -la";
      ll = "eza -l";
      ls = "eza";
      cat = "bat --style=numbers,changes,header";
      ".." = "cd ..";
      "..." = "cd ../..";

      # Editor
      v = "nvim";
      vim = "nvim";

      # Zellij
      z = "zellij";
      za = "zellij attach";
      znew = "zellij -s";

      # GCloud
      gprod = "gcloud container clusters get-credentials prod-factly --zone asia-south1-a --project factly-prod";
      gstag = "gcloud container clusters get-credentials stag-factly --zone asia-south1-a --project factly-prod";
    };

    plugins = with pkgs.fishPlugins; [
      {
        name = "done";
        src = done.src;
      }
      {
        name = "fzf-fish";
        src = fzf-fish.src;
      }
      {
        name = "forgit";
        src = forgit.src;
      }
      {
        name = "autopair";
        src = autopair.src;
      }
      {
        name = "colored-man-pages";
        src = colored-man-pages.src;
      }
      {
        name = "z";
        src = z.src;
      }
    ];
  };

  # Additional required packages
  home.packages = with pkgs; [
    eza
    fd
    starship
    ripgrep
    bat
    fzf
  ];
}
