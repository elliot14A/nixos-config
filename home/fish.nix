{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.fish = {
    enable = true;

    # Set greeting to empty string
    interactiveShellInit = ''
      # Disable greeting
      set -g fish_greeting ""

      # Set default environment variables
      set -gx EDITOR nvim
      set -gx VISUAL nvim
      set -gx TERM xterm-256color
      set -gx TAVILY_API_KEY replace_with_your_key

      # Add custom paths
      fish_add_path $HOME/.local/bin
      fish_add_path $HOME/.cargo/bin
      fish_add_path $HOME/.pulumi/bin
      fish_add_path $HOME/.ghcup/bin

      # Initialize starship
      if type -q starship
          starship init fish | source
      end

      # Configure FZF
      if type -q fzf
          set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'
          set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
          set -gx FZF_ALT_C_COMMAND 'fd --type d --hidden --follow --exclude .git'
      end
    '';

    shellAliases = {
      # System aliases
      l = "eza -la";
      ll = "eza -l";
      ls = "eza";
      cat = "bat";
      ".." = "cd ..";
      "..." = "cd ../..";

      # Editor aliases
      v = "nvim";
      vim = "nvim";

      # Zellij aliases
      z = "zellij";
      za = "z attach";
      znew = "z -s";

      # Kubernetes (generic, removed Factly-specific)
      kiwi-kube = "kubectl --kubeconfig=$HOME/.pulumi/k3s/config";
      kiwi-k9s = "KUBECONFIG=$HOME/.pulumi/k3s/config k9s";

      # Applications
      windsurf = "~/Downloads/Windsurf/bin/windsurf";
    };

    plugins = [
      {
        name = "autopair";
        src = pkgs.fishPlugins.autopair-fish.src;
      }
      {
        name = "fzf";
        src = pkgs.fishPlugins.fzf-fish.src;
      }
    ];

    functions = {
      # Configure fish user key bindings for vi mode
      fish_user_key_bindings = ''
        # Enable vi key bindings
        fish_vi_key_bindings

        # In vi mode, bind 'v' in normal mode to edit command line in external editor
        bind -M default v edit_command_buffer
      '';
    };
  };
}
