{pkgs, ...}:

{
  home.packages = with pkgs; [
    anki
    bluetui
    docker-compose
    feishin
    gedit
    grimblast
    kitty
    libnotify
    nerd-fonts.jetbrains-mono
    obsidian
    pulseaudio
    quickshell
    thunar
    tree
    satty
    steam
    wl-clipboard
  ];

}
