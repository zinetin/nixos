{ config, pkgs, ... }:

{
  # GTK Dark Theme
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
    gtk4 = {
      theme = null;
      extraConfig = {
        gtk-application-prefer-dark-theme = true;
      };
    };
  };

  # QT Apps styling
  qt = {
    enable = true;
    platformTheme.name = "gtk3";
    style.name = "adwaita-dark";
  };

  # Cursor theme
  home.pointerCursor = {
    name = "Breeze";
    pkgs.breeze-icons
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  # Environment variables
  home.sessionVariables = {
    GTK_THEME = "Adwaita:dark";
    QT_QPA_PLATFORMTHEME = "gtk3";
  };

  dconf.settings = {
    "org/gnome/gedit/preferences/editor" = {
      scheme = "Solarized Dark"
    }
  }
}
