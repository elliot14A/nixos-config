{
  description = "System configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05"; 
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hyprland
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    hyprspace = {
      url = "github:KZDKM/Hyprspace";
      inputs.hyprland.follows = "hyprland";
    };
    hy3 = {
      url = "github:outfoxxed/hy3";
      inputs.hyprland.follows = "hyprland";
    };

    # Zen Browser
    zen-browser.url = "github:MarceColl/zen-browser-flake";

    # Nixvim
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };  
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: 
    let vars = {
      system = "x86_64-linux";
      hostname = "nixos";
      username = "elliot";
    };
    in {
      nixosConfigurations.${vars.hostname} = nixpkgs.lib.nixosSystem {
        system = vars.system;
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          inputs.home-manager.nixosModules.default
        ];
        specialArgs = {
          inherit inputs;
          inherit vars;
          pkgs-stable = import inputs.nixpkgs-stable {
            system = vars.system;
            config.allowUnfree = true;
          };
        };
      };

      homeConfigurations.${vars.username} = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${vars.system};
        extraSpecialArgs = {
          inherit inputs;
          inherit vars;
          pkgs-stable = import inputs.nixpkgs-stable {
            system = vars.system;
            config.allowUnfree = true;
          };
        };
        modules = [
          ./home-manager/home.nix
        ];
      };
    };
}
