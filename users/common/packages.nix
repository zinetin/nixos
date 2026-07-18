{pkgs, inputs, ...}:

{
  imports = [
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
  ];

  home.packages = with pkgs; [
    anki
    bluetui
    cargo
    docker-compose
    feishin
    gedit
    grimblast
    kdePackages.ark
    kdePackages.dolphin
    kdePackages.qtsvg
    kitty
    libnotify
    megasync
    nerd-fonts.jetbrains-mono
    obsidian
    proton-vpn
    pulseaudio
    q4wine
    qbittorrent
    spotify
    thunar
    tree
    satty
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
