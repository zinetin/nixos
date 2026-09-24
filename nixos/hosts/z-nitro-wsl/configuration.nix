# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, ... }:

{
  imports = [
    ../../profiles/wsl/configuration.nix
  ];

  networking.hostName = "z-nitro-wsl"; # Define your hostname.

  #ooga booga special thingy that you SHOULN'T CHANGE UNLESS YOU NEED TO
  system.stateVersion = "26.05"; # Did you read the comment?
}
