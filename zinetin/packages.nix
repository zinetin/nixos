{pkgs, ...}:

{
  home.packages = with pkgs; [
    kitty
    feishin
    thunar
    quickshell
    pulseaudio
    bluetui
    wl-clipboard
    grimblast
    satty
    libnotify
  ];

}
