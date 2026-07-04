{config, pkgs, system, inputs, ...}:

{
  imports = 
  [
#    ./hypr/hyprland.nix
#    ./quickshell/quickshell.nix
    ./iridium.nix
    ./zen.nix
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
    enableDefaultConfig = false;
    settings = {
      "github.com" = {
        HostName = "github.com";
        User = "git";
        IdentityFile = "~/.ssh/github";
        AddKeysToAgent = "yes";
      };
    };
  };

  home.file."Pictures/Screenshots/.keep".text = "";
  
  home.stateVersion = "25.05";
}
