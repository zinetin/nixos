{inputs, pkgs, ...}:

{
  programs.plasma = {
    workspace = {
      colorScheme = "BreezeDark";
      wallpaper = "${inputs.wallpapers.packages.${pkgs.stdenv.hostPlatform.system}.default}/paint-skyline.webp";
    };

    kwin.effects.desktopSwitching.animation = "off";
  };
}
