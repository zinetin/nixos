{config, pkgs, system, inputs, ...}:

{
  imports = 
  [
#    ./hypr/hyprland.nix
#    ./quickshell/quickshell.nix

    ../common/home.nix
  ];
  home.username = "zinetin";
  home.homeDirectory = "/home/zinetin";

 
  home.stateVersion = "25.05";
}
