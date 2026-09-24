{config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    hyprland
    inputs.zen-browser.packages."${pkgs.stdenv.hostPlatform.system}".default
    ly
    os-prober
  ];
}
