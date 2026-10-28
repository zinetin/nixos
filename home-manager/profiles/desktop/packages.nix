{config, pkgs, inputs, ...}:

{
  home.packages = with pkgs; [
    anki
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
    obsidian
    olympus
    prismlauncher
    proton-vpn
    puddletag
    qbittorrent
    r2modman
    reaper
    shotcut
    steam
  ];

  programs = {
    obs-studio = {
      enable = true;
      plugins = with pkgs.obs-studio-plugins; [
        obs-pipewire-audio-capture
      ];
    };

    craftapps = {
      enable = true;
      enableAll = true;
      programs.figcraft.enable = false;
      programs.cadcraft.enable = false;
    }
  };

  services.flatpak.packages = [
    "org.vinegarhq.Sober"
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
