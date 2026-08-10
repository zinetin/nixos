{ config, pkgs, ... }:

{
  # Enable libvirtd
  virtualisation = {

    waydroid = {
      enable = true;
      package = pkgs.waydroid-nftables;
    };

    libvirtd = {
      enable = true;
      qemu.vhostUserPackages = [ pkgs.virtiofsd ];
      onBoot = "start";
      onShutdown = "shutdown";
      qemu = {
        package = pkgs.qemu_kvm;
        swtpm.enable = true;  # TPM support (optional)
      };
    };
  };

  security.polkit.enable = true;

  virtualisation.spiceUSBRedirection.enable = true;
}
