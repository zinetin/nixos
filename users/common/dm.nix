{ config, pkgs, inputs, ... }:

{
  # Your existing home config...

  # Import the end-4-hyprland home-manager module
  imports = [
    inputs.end-4-hyprland.homeManagerModules.default
  ];

  # Enable and configure dots-hyprland
  programs.dots-hyprland = {
    enable = true;
    source = inputs.end-4-hyprland + "/configs";
    packageSet = "essential";  # minimal | essential | all
    mode = "hybrid";             # hybrid | declarative | writable


  # Rest of your config...
}
