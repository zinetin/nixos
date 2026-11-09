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
    kdePackages.ffmpegthumbs
    kdePackages.qt6ct               # The Qt6 Configuration Tool middleware
    kdePackages.qtstyleplugin-kvantum
    kdePackages.qtsvg
    ly
    os-prober
  ];
}
