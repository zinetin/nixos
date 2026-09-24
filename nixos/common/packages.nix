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
    gcc
    git
    iptables
    meson
    mpv
    neovim 
    ninja
    openssl
    p7zip
    pkg-config
    qt6.qtmultimedia
    pulseaudio
    python3
    rclone
    rustc
    spice-gtk 
    udisks2
    unzip
    vial
    wineWow64Packages.stable
    winetricks
    wget
  ];

  services.flatpak.packages = [];


  programs = {
    fish.enable = true;

    appimage = {
      enable = true;
      binfmt = true;
      package = pkgs.appimage-run.override {
        extraPkgs = pkgs: [
          pkgs.libepoxy
          pkgs.mpv
        ];
      };
    };

    nix-ld.enable = true;

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
