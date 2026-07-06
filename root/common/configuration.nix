{config, pkgs, ...}:

{
  # Import other files in common to keep root.nix clean
  imports = 
  [
    ./appearance.nix
    ./packages.nix
    ./services.nix
    ./users.nix
    ./hardware-configuration.nix
  ];

  # Use Latest Kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.supportedFilesystems = [ "ntfs" ];

  
  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";
  console = {
    keyMap = "us";
  };

  # Set your time zone.
  time.timeZone = "Europe/London";
  nixpkgs.config.allowUnfree = true;

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  environment.pathsToLink = [ 
    "/share/applications" 
    "/share/xdg-desktop-portal" 
  ];

  # Enable docker
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
  };

}
