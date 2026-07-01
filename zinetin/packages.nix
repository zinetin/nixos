{pkgs, ...}:

{
  home.packages = with pkgs; [
    kitty
    feishin
    docker-compose
    thunar
    quickshell
    gedit
    nerd-fonts.jetbrains-mono
    pulseaudio
    bluetui
    wl-clipboard
    grimblast
    satty
    libnotify
  ];

}
