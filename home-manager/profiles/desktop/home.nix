{config, ...}:

{
  imports = [
    ./desktop-env.nix
    ./flatpak.nix
    ./packages.nix
    ./plasma.nix
    ./services.nix
    ./spicetify.nix
    ./zen.nix
  ];
}
