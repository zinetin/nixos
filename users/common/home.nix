{config, inputs, ...}:

{
  imports = [
    ./zen.nix
    ./iridium.nix
    ./nv-chad.nix
    ./packages.nix
    ./appearance.nix
  ];

  programs.git = {
    enable = true;
    settings.user = {
      name = "zinetin";
      email = "zinetin2050@proton.me";
      init.defaultBranch = "main";
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
