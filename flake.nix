{
  description = "My NixOS Flake Config";

  inputs = {

    dolphin-overlay = {
      url = "github:rumboon/dolphin-overlay";
    };

    iridium = {
      url = "github:zinetin/iridium";
      inputs.nixpkgs.follows = "nixpkgs";
    };

#    halley = {
#      url = "github:binarylinuxx/halley-flake";
#    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix4nvchad = {
      url = "github:nix-community/nix4nvchad";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak = {
      url = "github:gmodena/nix-flatpak/?ref=latest";
    };

    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
    };
    
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };
  
  outputs = {self, dolphin-overlay, iridium, home-manager, nix-flatpak, nixpkgs, nixos-wsl, zen-browser, ...} @inputs: {

# Not WSL
    
      # Laptop that I got for very cheap that is very good
      z-hp255 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./nixos/hosts/z-hp255/configuration.nix
          nix-flatpak.nixosModules.nix-flatpak
          iridium.nixosModules.default
#          halley.nixosModules.default
          home-manager.nixosModules.home-manager 
        ];
      };


      # GAMING laptop - Acer nitro an515-56
      z-nitro = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./nixos/hosts/z-nitro/configuration.nix
          nix-flatpak.nixosModules.nix-flatpak
          iridium.nixosModules.default
#          halley.nixosModules.default
          home-manager.nixosModules.home-manager
          ];
      };

# WSL

    # GAMING laptop - Acer nitro 5 an515-56 but its running in wsl
    nixosConfigurations = {
      z-nitro-wsl = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./nixos/hosts/z-nitro-wsl/configuration.nix
          nix-flatpak.nixosModules.nix-flatpak
          nixos-wsl.nixosModules.wsl
          home-manager.nixosModules.home-manager
        ];
      };
    };
  };
}
