{config, pkgs, ...}:

{
  programs.plasma = {
    configFile."kwinrc"."Windows"."FocusPolicy" = "FocusFollowsMouse";
  };
}
