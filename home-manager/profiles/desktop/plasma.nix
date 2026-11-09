{osConfig, lib, pkgs, ...}:

{
  imports = [
    ./plasma/appearance.nix
    ./plasma/general.nix
    ./plasma/keybinds.nix
  ];

  programs.plasma = {
    enable = osConfig.desktop == "plasma";
    overrideConfig = true;
  };
}
