{config, pkgs, ...}:

{
  environment.variables = {
    GTK_THEME = "Adwaita:dark";
    QT_QPA_PLATFORMTHEME = "gtk2";
  };

  # Make sure GTK apps use dark theme
  programs.dconf.enable = true;

  users.defaultUserShell = pkgs.fish;

  services.displayManager.ly.settings = {
    animation = "dur_file";

    dur_file_path = "/etc/nixos/root/common/blackhole-smooth-240x67.dur";

    dur_offset_alignment = "center";

    animation_frame_delay = 50;

    full_color = true;
  };
}
