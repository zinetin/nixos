{config, pkgs, inputs, ...}:

{
  imports = [
  ];

  home.packages = with pkgs; [
    anki
    chromium
    discord
    feishin
    feh
    mupdf
    gedit
    kitty
    krita
    libreoffice-qt-stable
    nicotine-plus
    obsidian
    (olympus.override { celesteWrapper = "steam-run"; })
    osu-lazer-bin
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
      apps.figcraft.enable = false;
      apps.cadcraft.enable = false;
    };
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
