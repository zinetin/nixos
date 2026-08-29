{config, inputs, pkgs, ...}:

{
  imports = [
    ./appearance.nix
    ./fish.nix
    ./flatpak.nix
    ./nv-chad.nix
    ./packages.nix
    ./zen.nix
  ];
  
  home.sessionVariables = {
    PATH = "$PATH:${pkgs.ninja}/bin";
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

# Fix dolphin
  xdg.configFile."menus/applications.menu".source = "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";
  home.file."Pictures/Screenshots/.keep".text = "";
}
