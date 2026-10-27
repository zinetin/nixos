{pkgs, ...}:

{
  imports = [
    ./plasma/appearance.nix
    ./plasma/polonium.nix
  ];

  home.packages = with pkgs.kdePackages; [
    krohnkite
  ];

  programs.plasma = {
    enable = true;
    overrideConfig = true;
  };
}
