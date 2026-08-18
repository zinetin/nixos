{config, ...}:

{
  home.username = "iridium";
  home.homeDirectory = "/home/iridium";

  imports = [
    inputs.iridium.homeModules.default
  ];

  programs.iridium = {
    enable = true;
    # additionalConfig = ./extra.lua;
  };

  
  home.stateVersion = "25.05";
}
