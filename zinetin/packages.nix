{pkgs, ...}:

{
  home.packages = with pkgs; [
    kitty
    feishin
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
