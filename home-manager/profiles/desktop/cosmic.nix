{inputs, pkgs, ...}:

{
  imports = [
    inputs.cosmic-manager.homeManagerModules.cosmic-manager

    ./cosmic/appearance.nix
    ./cosmic/general.nix
    ./cosmic/keybinds.nix
  ];

  wayland.desktopManager.cosmic.enable = true;
}
