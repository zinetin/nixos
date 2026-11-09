{config, ...}:

{
  environment.sessionVariables = {
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
  };

  qt = {
    enable = true;
    platformTheme = "qt5ct";
  };
}
