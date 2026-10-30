{config, lib, pkgs, modulesPath, ...}:

# This file is only for hardware configuration that will work on most pcs
{
  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings.General = {
        Enable = "Source,Sink,Media,Socket";
	  Experimental = true;
      };
    };
    keyboard.qmk.enable = true;
  };

  services.libinput.touchpad.disableWhileTyping = false;

  networking = {
    wireless.enable = false;
    networkmanager = {
      settings.device."wifi.iwd.autoconnect" = "no";
      enable = true;
      wifi.backend = "iwd";
    };
    wireless.iwd = {
      enable = true;
      settings.Settings.AutoConnect = false;
    };
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;  # Critical for Steam
  };
}
