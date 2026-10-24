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
    opentabletdriver.enable = true;
  };

  services.libinput.touchpad.disableWhileTyping = false;

  hardware.keyboard.qmk.enable = true;

  networking = {
    wireless.enable = false;
    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
    };
    wireless.iwd.enable = true;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;  # Critical for Steam
  };
}
