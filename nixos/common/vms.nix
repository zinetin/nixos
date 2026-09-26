{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
    virtio-win
  ];

  programs.virt-manager.enable = true;

  # Udev rule to make libvirt be able to read and write to /dev/sda
  services.udev.extraRules = ''
    SUBSYSTEM=="block", KERNEL=="sd?", ENV{ID_WWN}=="0x5001b448bb4e6ba1", GROUP="kvm", MODE="0660"
  '';

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
