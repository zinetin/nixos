{config, inputs, ...}:

{
  imports = [
    ./appearance.nix
    ./flatpak.nix
    ./iridium.nix
    ./nv-chad.nix
    ./packages.nix
    ./zen.nix
  ];

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
