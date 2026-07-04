{config, pkgs, system, inputs, ...}:

{
  # Programs
  environment.systemPackages = with pkgs; [
    neovim 
    wget
    fish
    inputs.zen-browser.packages."${pkgs.stdenv.hostPlatform.system}".default
    ly
    git
    curl
    pulseaudio
    os-prober
    python3
    bash
    p7zip
    wineWow64Packages.stable
    bottles
  ];
  programs = {
    fish.enable = true;
  };

}
