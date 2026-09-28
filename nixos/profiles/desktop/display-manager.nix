{config, pkgs, ...}:

{
  services.desktopManager.plasma6.enable = true;

  programs = {
#    hyprland.enable = true;

#    halley = {
#      enable = true;
#      package = inputs.halley.packages.${pkgs.system}.halley-unstable;
#    };

    iridium.enable = true;
  };


  services.displayManager.defaultSession = "hyprland";

  services.displayManager.ly = {
    enable = true;

    settings = {
      animation = "dur_file";

      animation_frame_delay = 50;

      dur_file_path = toString ./blackhole-smooth-240x67.dur;

      dur_offset_alignment = "center";

      full_color = true;

      save = true;
      
      load = true;
    };
  };
}
