{inputs, pkgs, ...}:

{
  programs.plasma = {
    workspace = {
      colorScheme = "BreezeDark";

      wallpaper = "${inputs.wallpapers.packages.${pkgs.system}.default}/paint-skyline.webp";
    };
  };
}
