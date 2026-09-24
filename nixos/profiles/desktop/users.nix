{config, pkgs, ...}:

{
  home-manager = {
    sharedModules = [ ../../home-manager/profiles/desktop/home.nix ];
  };
}
