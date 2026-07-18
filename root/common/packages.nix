{config, pkgs, system, inputs, ...}:

{
  # Programs
  environment.systemPackages = with pkgs; [
    bash
    curl
    fish
    git
    hyprland
    inputs.zen-browser.packages."${pkgs.stdenv.hostPlatform.system}".default
    ly
    mpv
    neovim 
    os-prober
    p7zip
    pulseaudio
    python3
    rclone
    spice-gtk 
    udisks2
    virt-manager
    virt-viewer
    virtio-win
    wineWow64Packages.stable
    winetricks
    wget
  ];

  services.flatpak.packages = [];

  programs = {
    virt-manager.enable = true;

    fish.enable = true;
#    hyprland.enable = true;
    iridium.enable = true;
    fuse = {
      enable = true;
      userAllowOther = true;
    };
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
  };
}
