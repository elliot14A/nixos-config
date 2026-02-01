{
  description = "NixOS configuration";

  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";

    home-managerU = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    home-managerS = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };

    flatpaks = {
      url = "github:in-a-dil-emma/declarative-flatpak/latest";
    };
  };

  outputs =
    {
      self,
      nixpkgs-unstable,
      nixpkgs-stable,
      home-managerU,
      home-managerS,
      noctalia,
      agenix,
      flatpaks,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      libU = nixpkgs-unstable.lib;
      libS = nixpkgs-stable.lib;

      mkWorkstation =
        { deviceModule, hmImports }:
        libU.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            deviceModule
            home-managerU.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                backupFileExtension = "backup";
                extraSpecialArgs = { inherit inputs; };
                users.kiwi = {
                  imports = hmImports;
                };
              };
            }
          ];
        };

      mkServer =
        { deviceModule, hmImports }:
        libS.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            deviceModule
            agenix.nixosModules.default
            ./modules/baseline.server.nix
            ./modules/ssh.nix
            home-managerS.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                backupFileExtension = "backup";
                extraSpecialArgs = { inherit inputs; };
                users.kiwi = {
                  imports = hmImports;
                };
              };
            }
          ];
        };
    in
    {
      nixosConfigurations = {
        kiwi = mkWorkstation {
          deviceModule = ./devices/laptop/kiwi/default.nix;
          hmImports = [
            ./home/common.nix
            ./home/fish.nix
            ./home/niri.nix
            ./home/zellij.nix
            ./home/flatpak.nix
          ];
        };
      };
    };
}
