{config, pkgs, ...}:

{
  home-manager = {
    sharedModules = [ ../../../home-manager/profiles/wsl/home.nix ];
  };
}
