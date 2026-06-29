{pkgs, ...}:

{
  home.packages = with pkgs; [
    kitty
    feishin
    thunar
    quickshell
    gedit
    jetbrains-mono
    pulseaudio
    bluetui
    wl-clipboard
    grimblast
    satty
    libnotify
  ];

}
