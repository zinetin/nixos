{config, inputs, lib, pkgs, ...}:

{
  imports = [
    ./appearance.nix
    ./fish.nix
    ./nvchad.nix
    ./packages.nix
    ./git.nix
  ];
  
  home.sessionVariables = {
    PATH = "$PATH:${pkgs.ninja}/bin";
  };


  home.activation = {
    removeGtkrc = inputs.home-manager.lib.hm.dag.entryBefore [ "checkLinkTargets" ] ''
      rm -f "$HOME/.gtkrc-2.0"
    '';
    kbuildsycoca = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      XDG_MENU_PREFIX=plasma- ${pkgs.kdePackages.kservice}/bin/kbuildsycoca6 --noincremental || true
      '';
  };
  

  home.file."Pictures/Screenshots/.keep".text = "";
}
