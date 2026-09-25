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


  services.displayManager.ly = {
    ly.enable = true;

    settings = {
      animation = "dur_file";

      dur_file_path = "/etc/nixos/root/common/blackhole-smooth-240x67.dur";

      dur_offset_alignment = "center";

      animation_frame_delay = 50;

      full_color = true;
    };
  };
}
