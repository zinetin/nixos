{config, inputs, pkgs, ...}:

{
  imports = [
    ./appearance.nix
    ./fish.nix
    ./flatpak.nix
    ./nv-chad.nix
    ./packages.nix
    ./services.nix
    ./zen.nix
  ];
  
  home.sessionVariables = {
    PATH = "$PATH:${pkgs.ninja}/bin";
  };


  home.activation = {
    removeGtkrc = inputs.home-manager.lib.hm.dag.entryBefore [ "checkLinkTargets" ] ''
      rm -f "$HOME/.gtkrc-2.0"
    '';
  };
  
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "zinetin";
        email = "zinetin2050@proton.me";
      };
      init.defaultBranch = "main";
      pull.rebase = "false";
    };
  };
  
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings = {
      "github.com" = {
        HostName = "github.com";
        User = "git";
        IdentityFile = "~/.ssh/github";
        AddKeysToAgent = "yes";
      };
    };
  };

  home.file."Pictures/Screenshots/.keep".text = "";
}
