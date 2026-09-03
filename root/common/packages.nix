{config, pkgs, system, inputs, ...}:

{
  # Programs
  environment.systemPackages = with pkgs; [
    bash
    bridge-utils
    curl
    dioxus-cli
    dnsmasq
    ffmpeg
    fish
    gcc
    git
    hyprland
    inputs.zen-browser.packages."${pkgs.stdenv.hostPlatform.system}".default
    iptables
    ly
    meson
    mpv
    neovim 
    ninja
    openssl
    os-prober
    p7zip
    pkg-config
    pulseaudio
    python3
    rclone
    rustc
    spice-gtk 
    udisks2
    unzip
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

    appimage = {
      enable = true;
      binfmt = true;
    };

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
