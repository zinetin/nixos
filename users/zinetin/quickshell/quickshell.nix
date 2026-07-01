{config, pkgs, ...}:

{
  programs.quickshell = {
    enable = true;
  };

  xdg.configFile."quickshell" = {
    source = ./config";
    recursive = true;
  };
}
