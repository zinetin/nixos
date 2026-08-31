# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix

      ../common/configuration.nix
    ];

  boot.loader = {
    efi.efiSysMountPoint = "/boot/EFI";
  };

  networking.hostName = "z-hp255"; # Define your hostname.

  #ooga booga special thingy that you SHOULN'T CHANGE UNLESS YOU NEED TO
  system.stateVersion = "26.05"; # Did you read the comment?

}

