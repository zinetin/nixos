{config, pkgs, system, inputs, ...}:

{
  # Programs
  environment.systemPackages = with pkgs; [
    bash
    bottles
    curl
    fish
    git
    hyprland
    inputs.zen-browser.packages."${pkgs.stdenv.hostPlatform.system}".default
    ly
    mpv
    neovim 
    os-prober
    p7zip
    pulseaudio
    python3
    rclone
    udisks2
    wineWow64Packages.stable
    wget
  ];

  services.flatpak.packages = [];

  programs = {
    fish.enable = true;
#    hyprland.enable = true;
    iridium.enable = true;
    fuse = {
      enable = true;
      userAllowOther = true;
    };
  };
}
