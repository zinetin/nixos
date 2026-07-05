{config, ...}:

{
  home.username = "iridium";
  home.homeDirectory = "/home/iridium";

  programs.git = {
    enable = true;
    settings.user = {
      name = "zinetin";
      email = "zinetin2050@proton.me";
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
  
  home.stateVersion = "25.05";
}
