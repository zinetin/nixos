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
    nerd-fonts.jetbrains-mono
    obsidian
    pulseaudio
    q4wine
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
}
