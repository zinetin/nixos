{config, pkgs, ...}:

{
  programs.quickshell = {
    enable = true;
  };

  xdg.configFile."quickshell" = {
    source = ./quickshell;
    recursive = true;
  };
}
