{config, pkgs, system, inputs, ...}:

{
  # Programs
  environment.systemPackages = with pkgs; [
    bash
    bridge-utils
    curl
    dnsmasq
    ffmpeg
    fish
    git
    hyprland
    inputs.zen-browser.packages."${pkgs.stdenv.hostPlatform.system}".default
    iptables
    ly
    meson
    mpv
    neovim 
    ninja
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

  services.desktopManager.plasma6.enable = true;

  programs = {
    virt-manager.enable = true;

    fish.enable = true;

    # hyprland.enable = true;

    halley = {
      enable = true;
      package = inputs.halley.packages.${pkgs.system}.halley-unstable;
    };

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
