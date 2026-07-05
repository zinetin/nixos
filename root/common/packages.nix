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
    neovim 
    os-prober
    p7zip
    pulseaudio
    python3
    wineWow64Packages.stable
    wget
  ];
  programs = {
    fish.enable = true;
#    hyprland.enable = true;
    iridium.enable = true;
  };
}
