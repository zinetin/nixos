{ config, pkgs, ... }:

{
  # Enable libvirtd
  virtualisation.libvirtd = {
    enable = true;
    onBoot = "start";
    onShutdown = "shutdown";
    qemu = {
      package = pkgs.qemu_kvm;
      swtpm.enable = true;  # TPM support (optional)
    };
  };

  security.polkit.enable = true;

  # Optional: Add udev rules for USB access
  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTR{idVendor}=="3938", ATTR{idProduct}=="1191", GROUP="kvm", MODE="0666"
  '';
}
