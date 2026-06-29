{config, pkgs, ...}

{
  programs.quickshell = {
    enable = true;
  };

  xdg.configFile."quickshell" = {
    source = ./default.qml;
  };
}
