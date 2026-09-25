{config, pkgs, ...}:

{
  environment.variables = {
    GTK_THEME = "Adwaita:dark";
    QT_QPA_PLATFORMTHEME = "gtk2";
  };

  # Make sure GTK apps use dark theme
  programs.dconf.enable = true;

  users.defaultUserShell = pkgs.fish;
}
