{pkgs, ...}:

{
  imports = [
    ./plasma/appearance.nix
    ./plasma/general.nix
    ./plasma/keybinds.nix
  ];

  programs.plasma = {
    enable = true;
    overrideConfig = true;
  };
}
