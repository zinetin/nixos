{pkgs, ...}:

{
  home.packages = with pkgs; [
    kitty
    feishin
    thunar
    quickshell
    gedit
    jetbrains-mono
    breeze-icons
    gedit-plugins
    pulseaudio
    bluetui
    wl-clipboard
    grimblast
    satty
    libnotify
  ];

}
