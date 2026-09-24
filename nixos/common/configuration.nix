{config, pkgs, inputs, ...}:

{
  # Import other files in common to keep root.nix clean
  imports = 
  [
    ./appearance.nix
    ./packages.nix
    ./services.nix
    ./users.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";
  console = {
    keyMap = "us";
  };

  home-manager.backupFileExtension = "hm-bak";

  # Set your time zone.
  time.timeZone = "Europe/London";
  nixpkgs.config.allowUnfree = true;

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
