{ config, pkgs, ... }:
let
  gruvbox = {
    bg0 = "#282828";
    bg1 = "#3c3836";
    bg2 = "#504945";
    bg3 = "#665c54";
    bg4 = "#7c6f64";
    fg0 = "#fbf1c7";
    fg1 = "#ebdbb2";
    fg2 = "#d5c4a1";
    fg3 = "#bdae93";
    fg4 = "#a89984";
    red = "#cc241d";
    green = "#98971a";
    yellow = "#d79921";
    blue = "#458588";
    purple = "#b16286";
    aqua = "#689d6a";
    orange = "#d65d0e";
  };
in
{
  # Enable Fish Shell
  programs.fish = {
    enable = true;

    shellInit = ''
      # Set default environment variables
      set -gx EDITOR vim
      set -gx VISUAL vim
      set -gx TERM xterm-256color
      
      # Add custom paths if needed
      fish_add_path $HOME/.local/bin
      
      # Initialize Starship
      starship init fish | source
      
      # Set FZF defaults with Gruvbox colors
      set -gx FZF_DEFAULT_OPTS "
        --color=bg+:${gruvbox.bg1},bg:${gruvbox.bg0},spinner:${gruvbox.yellow},hl:${gruvbox.yellow}
        --color=fg:${gruvbox.fg2},header:${gruvbox.yellow},info:${gruvbox.blue},pointer:${gruvbox.blue}
        --color=marker:${gruvbox.blue},fg+:${gruvbox.fg0},prompt:${gruvbox.blue},hl+:${gruvbox.yellow}
      "
    '';

    interactiveShellInit = ''
      # Enable Vi mode
      fish_vi_key_bindings
      
      # Set Gruvbox colors for Fish
      set -g fish_color_normal ${gruvbox.fg1}
      set -g fish_color_command ${gruvbox.blue}
      set -g fish_color_param ${gruvbox.fg2}
      set -g fish_color_quote ${gruvbox.green}
      set -g fish_color_error ${gruvbox.red}
      set -g fish_color_comment ${gruvbox.bg4}
      set -g fish_color_selection --background=${gruvbox.bg2}
      set -g fish_color_search_match --background=${gruvbox.bg2}
      set -g fish_color_operator ${gruvbox.aqua}
      set -g fish_color_escape ${gruvbox.purple}
      set -g fish_color_autosuggestion ${gruvbox.bg4}
      
      # Disable greeting
      set -g fish_greeting ""
    '';

    shellAliases = {
      # System
      l = "exa -la";
      ll = "exa -l";
      ls = "exa";
      cat = "bat";
      ".." = "cd ..";
      "..." = "cd ../..";
      
      # Git shortcuts
      g = "git";
      ga = "git add";
      gc = "git commit";
      gp = "git push";
      gs = "git status";
      
      # NixOS specific
      rebuild = "sudo nixos-rebuild switch";
      update = "sudo nix-channel --update && sudo nixos-rebuild switch";
      garbage = "sudo nix-collect-garbage -d";
      
      # Editor
      v = "vim";
    };
  };

  # System-wide configurations
  environment = {
    systemPackages = with pkgs; [
      # Shell and utilities
      fish
      starship
      fzf
      bat
      exa
      fd
      ripgrep

      # Fish plugins
      fishPlugins.done
      fishPlugins.fzf-fish
      fishPlugins.forgit
    ];

    # Bat configuration with Gruvbox
    etc."bat/config".text = ''
      --theme="gruvbox-dark"
      --style="numbers,changes,header"
      --color=always
      --italic-text=always
      --wrap=never
    '';
  };

  # Starship configuration
  programs.starship = {
    enable = true;
    settings = {
      # Use custom colors matching Gruvbox
      palette = "gruvbox";
      palettes.gruvbox = {
        red = "${gruvbox.red}";
        green = "${gruvbox.green}";
        blue = "${gruvbox.blue}";
        yellow = "${gruvbox.yellow}";
        purple = "${gruvbox.purple}";
        aqua = "${gruvbox.aqua}";
        orange = "${gruvbox.orange}";
        fg0 = "${gruvbox.fg0}";
        fg1 = "${gruvbox.fg1}";
        fg2 = "${gruvbox.fg2}";
      };

      # Prompt customization
      character = {
        success_symbol = "[➜](${gruvbox.green})";
        error_symbol = "[➜](${gruvbox.red})";
      };

      directory = {
        style = "bold ${gruvbox.blue}";
      };

      git_branch = {
        style = "bold ${gruvbox.purple}";
      };

      git_status = {
        style = "bold ${gruvbox.red}";
      };
    };
  };

}
