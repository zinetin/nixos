{pkgs, ...}:

{
  imports = [
    ./plasma/polonium.nix
    ./plasma/workspace.nix
  ];

  home.packages = with pkgs.kdePackages; [
    krohnkite
  ];

  programs.plasma = {
    enable = true;
    overrideConfig = true;
  };
}
