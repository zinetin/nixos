{config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    anydesk
    hyprland
    inputs.zen-browser.packages."${pkgs.stdenv.hostPlatform.system}".default
    ly
    os-prober
  ];
}
