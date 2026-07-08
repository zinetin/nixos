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
    
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };
  
  outputs = {self, dolphin-overlay, iridium, home-manager, nix-flatpak, nixpkgs, zen-browser, ...} @inputs: {

    # Bad ASUS notebook laptop
    nixosConfigurations = {
      notebook = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./root/notebook/root.nix
          nix-flatpak.nixosModules.nix-flatpak
          iridium.nixosModules.default
  	      home-manager.nixosModules.home-manager {
  	        home-manager = {
  	          useGlobalPkgs = true;
  	          useUserPackages = true;
  	          users.zinetin = import ./users/zinetin/home.nix;
  	          users.iridium = import ./users/iridium/home.nix;
              extraSpecialArgs = { inherit inputs; };
  	        };
        	}
        ];
      };

      # GAMING laptop - Acer nitro an515-56
      nitro = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./root/nitro/root.nix
          nix-flatpak.nixosModules.nix-flatpak
          iridium.nixosModules.default
  	      home-manager.nixosModules.home-manager {
  	        home-manager = {
  	          useGlobalPkgs = true;
  	          useUserPackages = true;
  	          users.zinetin = import ./users/zinetin/home.nix;
              extraSpecialArgs = { inherit inputs; };
  	        };
        	}
        ];
      };
    };
  };
}
