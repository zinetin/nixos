{pkgs, ...}:

{
  home.packages = with pkgs; [
    anki
    bluetui
    cargo
    docker-compose
    feishin
    gedit
    grimblast
    kitty
    libnotify
    nerd-fonts.jetbrains-mono
    obsidian
    pulseaudio
    thunar
    tree
    satty
    steam
    wl-clipboard
  ];

  services.flatpak.packages = [
    org.prismlauncher.PrismLauncher
    io.github.everestapi.Olympus
  ];
}
