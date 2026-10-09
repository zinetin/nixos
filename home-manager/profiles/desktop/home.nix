{config, ...}:

{
  imports = [
    ./desktop-env.nix
    ./flatpak.nix
    ./packages.nix
    ./services.nix
    ./spicetify.nix
    ./zen.nix
  ];
}
