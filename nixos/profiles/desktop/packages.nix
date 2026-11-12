{config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    anydesk
    hyprland
    inputs.zen-browser.packages."${pkgs.stdenv.hostPlatform.system}".default
    kdePackages.ark
    kdePackages.dolphin
    kdePackages.kio-fuse
    kdePackages.kio-extras
    kdePackages.kimageformats
    kdePackages.kService
    kdePackages.ffmpegthumbs
    kdePackages.qt6ct
    kdePackages.qtmultimedia
    kdePackages.qtstyleplugin-kvantum
    kdePackages.qtsvg
    libsForQt5.qtstyleplugin-kvantum
    ly
    os-prober
  ];

  fonts.packages = with pkgs; [
    poppins
  ];
}
