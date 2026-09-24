{config, pkgs, ...}:

{
  home.packages = with pkgs; [
    anki
    audacity
    davinci-resolve
    discord
    feishin
    feh
    mupdf
    gedit
    kdePackages.ark
    kdePackages.dolphin
    kdePackages.qtsvg
    kdePackages.kio-fuse
    kdePackages.kio-extras
    kdePackages.kimageformats
    kdePackages.ffmpegthumbs
    kitty
    krita
    libreoffice-qt-stable
    nicotine-plus
    obs-studio
    obsidian
    proton-vpn
    puddletag
    qbittorrent
    r2modman
    reaper
    shotcut
    spotify
    steam
  ]
  services.flatpak.packages = [
    "org.prismlauncher.PrismLauncher"
    "io.github.everestapi.Olympus"
  ];

  # Default applications to open stuff

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "zen-beta.desktop";
      "x-scheme-handler/http" = "zen-beta.desktop";
      "x-scheme-handler/https" = "zen-beta.desktop";
    };
  }; 
}
