{config, ...}:

{
  imports = [
    ../../common/configuration.nix

    ./desktop-services.nix
    ./display-manager.nix
    ./firewall.nix
    ./hardware-configuration.nix
    ./users.nix
  ];

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
}
