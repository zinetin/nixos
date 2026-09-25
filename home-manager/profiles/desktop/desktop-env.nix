{config, inputs, pkgs, ...}:

{
  imports = [
    inputs.iridium.homeModules.default
  ];

  programs.iridium = {
    enable = true;
    # additionalConfig = ./extra.lua;
  };
}
