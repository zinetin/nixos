{config, pkgs, ...}:

{
  # Import other files in common to keep root.nix clean
  include [
    ./appearance.nix
    ./packages.nix
    ./services.nix
    ./users.nix
  ]

  # Use Latest Kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;
  
  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";
  console = {
    keyMap = "us";
  };

  # Set your time zone.
  time.timeZone = "Europe/London";

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;


  # Enable docker
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
  };

}
