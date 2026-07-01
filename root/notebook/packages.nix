{config, pkgs, system, inputs, ...}:

{
  # Programs
  environment.systemPackages = with pkgs; [
    neovim 
    hyprland
    wget
    fish
    inputs.zen-browser.packages."${pkgs.stdenv.hostPlatform.system}".default
    ly
    git
    curl
    pulseaudio
    os-prober
  ];
  programs = {
    hyprland.enable = true;
    fish.enable = true;
  };

}
