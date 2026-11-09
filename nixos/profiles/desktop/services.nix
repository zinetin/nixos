{config, pkgs, ...}:

{
  services = {
    blueman.enable = true;
  };

  services.gvfs.enable = true;
  services.tumbler.enable = true; 
  security.polkit.enable = true;

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    settings.publish = {
      "disable-publishing" = false;
      disable-user-service-publishing = false;
    };
  };
}
