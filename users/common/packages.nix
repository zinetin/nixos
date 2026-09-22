{pkgs, inputs, ...}:

{
  imports = [
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
  ];

  home.packages = with pkgs; [
    anki
    audacity
    bluetui
    cargo
    davinci-resolve
    docker-compose
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
    libnotify
    libreoffice-qt-stable
    megasync
    nerd-fonts.jetbrains-mono
    noisetorch
    nicotine-plus
    obs-studio
    obsidian
    proton-vpn
    puddletag
    pulseaudio
    q4wine
    qbittorrent
    r2modman
    reaper
    shotcut
    spotify
    thunar
    tree
    steam
    wl-clipboard
  ];

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
