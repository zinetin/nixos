{pkgs, ...}:

{
  home.packages = with pkgs; [
    kitty
    feishin
    docker-compose
    thunar
    quickshell
    obsidian
    steam
    gedit
    tree
    nerd-fonts.jetbrains-mono
    pulseaudio
    bluetui
    wl-clipboard
    grimblast
    satty
    libnotify
  ];

}
