{config, pkgs, ...}:

{
  services = {
    blueman.enable = true;
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    settings.publish = {
      "disable-publishing" = false;
      disable-user-service-publishing = false;
    };
  };
}
