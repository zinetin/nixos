{inputs, pkgs, ...}:

{
  programs.plasma = {
    workspace = {
      colorScheme = "BreezeDark";
      wallpaper = "${inputs.wallpapers.packages.${pkgs.stdenv.hostPlatform.system}.default}/paint-skyline.webp";
    };

    # Inject the required settings into kwinrc
    configFile."kwinrc" = {
      "org.kde.kdecoration2" = {
        # Enforce the border size (options include: NoBorders, Tiny, Normal, Large, VeryLarge, Huge)
        "BorderSize" = "Normal";
        # Set the border size strictly for the active window profile
        "BorderSizeAuto" = "false";
      };
    };

    # Inject the outline rule directly into the Breeze theme configuration
    configFile."breezerc" = {
      "Windeco" = {
        # Enforces a visible outline border around active windows
        "DrawWindowOutline" = "true";
      };
    };

    configFile."kdeglobals" = {
      "General" = {
        "accentColorFromWallpaper" = "true"; 
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
