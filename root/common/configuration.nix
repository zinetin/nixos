{config, pkgs, inputs, ...}:

{
  # Import other files in common to keep root.nix clean
  imports = 
  [
    ./appearance.nix
    ./hardware-configuration.nix
    ./packages.nix
    ./services.nix
    ./users.nix
    ./vms.nix
  ];

  programs.noisetorch.enable = true;

  services.libinput.touchpad.disableWhileTyping = false;
  boot = {
    loader = {
      grub = {
        enable = true;
        useOSProber = true;
        devices = [ "nodev" ];
        efiSupport = true;
      };
      efi.canTouchEfiVariables = true;
    };
    kernel.sysctl = {
      "net.ipv4.ip_forward" = 1;
      "net.ipv6.conf.all.forwarding" = 1;
    };
    kernelPackages = pkgs.linuxPackages_zen;
    supportedFilesystems = [ "ntfs" ];
  };

  networking.firewall.trustedInterfaces = [ "waydroid0" ];
  
  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";
  console = {
    keyMap = "us";
  };

  home-manager.backupFileExtension = "backup";

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
