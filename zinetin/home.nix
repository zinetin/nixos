{config, pkgs, system, inputs, ...}:

{
  imports = 
  [
    ./hypr/hyprland.nix
    ./appearance.nix
    ./nv-chad.nix
    ./packages.nix
  ];
  home.username = "zinetin";
  home.homeDirectory = "/home/zinetin";

  programs.git = {
    enable = true;
    settings.user = {
      name = "zinetin";
      email = "zinetin2050@proton.me";
    };
  };
  
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
    matchBlocks."github.com" = {
      identityFile = "~/.ssh/github";
    };
  };

  home.file."Pictures/Screenshots/.keep".text = "";
  
  home.stateVersion = "25.05";
}
