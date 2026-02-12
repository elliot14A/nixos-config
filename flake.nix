{
  description = "NixOS configuration";

  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-managerU = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    flatpaks = {
      url = "github:in-a-dil-emma/declarative-flatpak/latest";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs =
    {
      nixpkgs-unstable,
      home-managerU,
      noctalia,
      agenix,
      flatpaks,
      nixvim,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      libU = nixpkgs-unstable.lib;

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
            ./home/nixvim.nix
          ];
        };
      };
    };
}
