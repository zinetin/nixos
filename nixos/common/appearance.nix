{config, pkgs, ...}:

{
  environment.variables = {
    GTK_THEME = "Adwaita:dark";
  };

  # Make sure GTK apps use dark theme
  programs.dconf.enable = true;

  users.defaultUserShell = pkgs.fish;
}
