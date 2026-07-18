{ config, pkgs, ... }:

{
  # Enable libvirtd
  virtualisation.libvirtd.enable = true;
  
  # Enable QEMU/KVM
  virtualisation.libvirtd.qemu = {
    package = pkgs.qemu_kvm;
    swtpm.enable = true;  # TPM support (optional)
    ovmf.enable = true;   # UEFI support
    ovmf.packages = [ pkgs.OVMFFull.fd ];
  };

  # Add your user to the libvirtd group
  users.users.yourusername.extraGroups = [ "libvirtd" ];

  # Optional: Install virt-manager GUI
  programs.virt-manager.enable = true;
  
  # Optional: Install guest tools
  environment.systemPackages = with pkgs; [
    virt-manager      # GUI for managing VMs
    virt-viewer       # Lightweight VM viewer
    spice-gtk         # SPICE client for better display/audio
    win-virtio        # Windows virtio drivers (if running Windows guests)
  ];
}
