{pkgs, ...}:

{
  imports = [
    ./plasma/appearance.nix
    ./plasma/keybinds.nix
  ];

  home.packages = with pkgs.kdePackages; [
    krohnkite
  ];

  programs.plasma = {
    enable = true;
    overrideConfig = true;
  };
}
