{config, pkgs, system, inputs, ...}:

{
  imports = 
  [
#    ./hypr/hyprland.nix
#    ./quickshell/quickshell.nix

    inputs.iridium.homeModules.default
    ../common/home.nix
  ];
  home.username = "zinetin";
  home.homeDirectory = "/home/zinetin";

  programs.iridium = {
    enable = true;
    # additionalConfig = ./extra.lua;
  };

  home.stateVersion = "25.05";
}
