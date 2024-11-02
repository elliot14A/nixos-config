{  pkgs, ... }:

{
  programs.nushell = {
    enable = true;
    
    # Configure environment variables
    shellAliases = {
      # Nix commands
      rebuild = "sudo nixos-rebuild switch";
      rebuild-boot = "sudo nixos-rebuild boot";
      garbage = "sudo nix-collect-garbage -d";
      update = "sudo nix-channel --update";
      shell = "nix-shell";
      repl = "nix repl";
      search = "nix search nixpkgs";
      run = "nix run nixpkgs#";

      # Directory navigation
      ll = "ls -l";
      la = "ls -la";
      ".." = "cd ..";
      "..." = "cd ../..";
      home = "cd ~";

      # Git shortcuts
      gs = "git status";
      ga = "git add";
      gc = "git commit";
      gp = "git push";
      gl = "git log --oneline";
    };

    extraConfig = ''
      # Environment Setup
      $env.EDITOR = "nvim"
      $env.VISUAL = "nvim"
      $env.PAGER = "less -R"
      $env.LANG = "en_US.UTF-8"
      $env.LC_ALL = "en_US.UTF-8"

      # Path configuration
      $env.PATH = ($env.PATH | split row (char esep) | append ["~/.local/bin", "~/.cargo/bin"])

      # Custom prompt (if not using starship)
      $env.PROMPT_COMMAND = {
          let dir = ($env.PWD | str replace $env.HOME "~")
          let git_branch = (do { git branch --show-current } | complete | get stdout | str trim)
          let git_status = (do { git status --porcelain } | complete | get stdout | str trim)
          let branch_info = (if ($git_branch | empty?) { "" } else { $"(ansi green)[$git_branch](ansi reset)" })
          let status_info = (if ($git_status | empty?) { "" } else { $"(ansi red)*" })
          $"(ansi blue)[$dir](ansi reset) ($branch_info)($status_info)\n❯ "
      }

      # Nix system management functions
      def "nix flake-update" [] {
          cd /etc/nixos
          sudo nix flake update
          sudo nixos-rebuild switch
      }

      def "nix clean" [] {
          echo "Cleaning old generations..."
          sudo nix-collect-garbage -d
          echo "Optimizing nix store..."
          sudo nix store optimise
          echo "Done cleaning system!"
      }

      def "nix generations" [] {
          sudo nix-env --list-generations --profile /nix/var/nix/profiles/system
      }

      def "nix test-config" [] {
          sudo nixos-rebuild test
          echo "Configuration built and activated temporarily. Reboot to revert."
      }

      def "system-info" [] {
          let kernel = (uname -r)
          let mem = (free -h | lines | skip 1 | first | split row " " | where { |it| $it != "" } | get 1)
          let uptime = (uptime -p)
          let host = (hostname)
          
          echo $"System Information:
          Hostname: ($host)
          Kernel: ($kernel)
          Memory: ($mem)
          Uptime: ($uptime)"
      }

      def "nix-install" [package: string] {
          echo $"Searching for ($package)..."
          nix search nixpkgs $package
          echo $"\nTo install, run: nix-env -iA nixos.($package)"
      }

      # Load zoxide for better directory navigation
      if (which zoxide | empty?) == false {
          zoxide init nushell | save -f ~/.cache/nushell/zoxide.nu
          source ~/.cache/nushell/zoxide.nu
      }
    '';

    extraEnv = ''
      # Default config paths
      $env.NU_LIB_DIRS = [
          "~/.config/nushell/scripts"
      ]

      $env.NU_PLUGIN_DIRS = [
          "~/.config/nushell/plugins"
      ]
    '';
  };

  # Install required packages
  environment.systemPackages = with pkgs; [
    # Core utilities
    zoxide       # Better cd

    # Additional tools that work well with Nushell
    delta        # Better git diff
    bottom       # System monitor
    du-dust      # Better du
    procs        # Better ps
  ];

  # Configure starship prompt
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      character = {
        success_symbol = "[❯](green)";
        error_symbol = "[❯](red)";
      };
      directory = {
        truncation_length = 3;
        truncate_to_repo = false;
      };
    };
  };

  # Enable zoxide for better directory navigation
  programs.zoxide = {
    enable = true;
    enableNushellIntegration = true;
  };

  # Set Nushell as default shell for your user
  users.users.<your-username> = {
    shell = pkgs.nushell;
  };
}
