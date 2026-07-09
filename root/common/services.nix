{config, ...}:

{
  services = {
    displayManager.ly.enable = true;

    blueman.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };

    libinput.enable = true;
    printing.enable = true;
    openssh.enable = true;

    udisks2.enable = true;

    flatpak = {
      enable = true;
      update.onActivation = true;
    };
  };
}
