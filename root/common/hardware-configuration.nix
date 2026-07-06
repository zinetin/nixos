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
  };
}
