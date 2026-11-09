{cosmicLib, config, inputs, pkgs, ...}:

let
  inherit (cosmicLib.config) mkRON;
  wallpaper = "${inputs.wallpapers.packages.${pkgs.stdenv.hostPlatform.system}.default}/paint-skyline.webp";
in 
{
  wayland.desktopManager.cosmic = {
  wallpapers = [
    {  
      output = "all";
      source = mkRON "enum" {
        variant = "path";
        value = [ wallpaper ];
      };
      filter_by_theme = false;
      filter_method = mkRON "enum" "Lanczos";
      sampling_method = mkRON "enum" "Alphanumeric";
      scaling_mode = mkRON "enum" "Zoom";
      rotation_frequency = 300;
    }
  ];
    panels = [
      {
        name = "Panel";
        anchor = mkRON "enum" "Left";
        anchor_gap = false;   # true gives a floating panel with gaps
      }
    ];
  };
}
