{pkgs, inputs, ...}:

{
  imports = [
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
  ];

  home.packages = with pkgs; [
    bluetui
    cargo
    docker-compose
    libnotify
    nerd-fonts.jetbrains-mono
    noisetorch
    pulseaudio
    q4wine
    tree
    wl-clipboard
  ];
}
