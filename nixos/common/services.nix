{config, pkgs, ...}:

{
  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };

    gnome.gnome-keyring.enable = true;

    libinput.enable = true;

    printing = {
      enable = true;
      drivers = [ pkgs.epson-escpr2 pkgs.epson-escpr pkgs.cups-filters ];
      listenAddresses = [ "*:631" ]; 
      allowFrom = [ "all" ];
      defaultShared = true;
      browsing = true;
      extraConf = ''
        ServerAlias *
        DefaultEncryption Never
      '';
    };

  
    openssh.enable = true;

    udisks2.enable = true;

    flatpak = {
      enable = true;
      update.onActivation = true;
    };
  };


}
