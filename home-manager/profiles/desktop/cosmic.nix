{inputs, pkgs, ...}:

{
  imports = [
    inputs.cosmic-manager.homeManagerModules.cosmic-manager
  ];

  wayland.desktopManager.coismic.enable = true;
}
