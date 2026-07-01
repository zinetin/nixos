{
  description = "My NixOS Flake Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    zen-browser.url = "github:youwen5/zen-browser-flake";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix4nvchad = {
      url = "github:nix-community/nix4nvchad";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  
  outputs = {self, nixpkgs, home-manager, zen-browser, ...} @inputs: {

    # Bad ASUS notebook laptop
    nixosConfigurations = {
      notebook = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./root/notebook/root.nix
  	      home-manager.nixosModules.home-manager {
  	        home-manager = {
  	          useGlobalPkgs = true;
  	          useUserPackages = true;
  	          users.zinetin = import ./zinetin/home.nix;
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
  	      home-manager.nixosModules.home-manager {
  	        home-manager = {
  	          useGlobalPkgs = true;
  	          useUserPackages = true;
  	          users.zinetin = import ./zinetin/home.nix;
              extraSpecialArgs = { inherit inputs; };
  	        };
        	}
        ];
      };
    };
  };
}
