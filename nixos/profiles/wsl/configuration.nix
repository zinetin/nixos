{config, pkgs, inputs, ...}:

{
  # Import other files in common to keep root.nix clean
  imports = 
  [
    ../../common/configuration.nix
  ];

  wsl.enable = true;
  wsl.defaultUser = "zinetin";
}
