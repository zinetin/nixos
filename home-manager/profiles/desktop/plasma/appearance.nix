{inputs, pkgs, ...}:

{
  programs.plasma = {
    workspace = {
      colorScheme = "BreezeDark";
      wallpaper = "${inputs.wallpapers.packages.${pkgs.stdenv.hostPlatform.system}.default}/paint-skyline.webp";
    };

    configFile = {
      "kdeglobals" = {
        "WM" = {
          "frame" = "61,174,233";
          "inactiveFrame" = "239,240,241";
        };
      };
    };
    
    kwin.effects.desktopSwitching.animation = "off";
    window-rules = [
      {
        description = "Transparent or Borderless Windows Rule";
        match = {
          window-class = {
            value = ".*";
            type = "regex";
          };
          window-types = [ "normal" ];
        };
        apply = {
          noborder = {
            value = true;
            apply = "force";
          };
        };
      }
    ];
  };
}
