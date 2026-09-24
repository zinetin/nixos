{config, inputs, pkgs, ...}:

{
  imports = [
    ./appearance.nix
    ./fish.nix
    ./nv-chad.nix
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
  };
  

  home.file."Pictures/Screenshots/.keep".text = "";
}
