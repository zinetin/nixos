{ lib, ... }:
let
  desktops = lib.range 1 10;
  numKey = n: if n == 10 then "0" else toString n;

  shifted = {
    "1" = "!"; "2" = "@"; "3" = "#"; "4" = "$"; "5" = "%";
    "6" = "^"; "7" = "&"; "8" = "*"; "9" = "("; "0" = ")";
  };

  app = name: key: command: { inherit name key command; };

  shotDir = "$HOME/Pictures/Screenshots";
  stamp = "$(date +%Y%m%d-%H%M%S)";

  # ------------------------------------------------------- Krohnkite directions
  dirs = [
    { k = "Left";  arrow = "Left";  vim = "H"; size = "ShrinkWidth"; }
    { k = "Right"; arrow = "Right"; vim = "L"; size = "GrowWidth"; }
    { k = "Up";    arrow = "Up";    vim = "K"; size = "ShrinkHeight"; }
    { k = "Down";  arrow = "Down";  vim = "J"; size = "GrowHeight"; }
  ];
  
  # ----------------------------------------------------------- virtual desktops
  # Super+N -> desktop N, Super+Shift+N -> move window to desktop N.
  desktopShortcuts = lib.listToAttrs (lib.concatMap (n: [
    { name = "Switch to Desktop ${toString n}";
      value = "Meta+${numKey n}"; }
    { name = "Window to Desktop ${toString n}";
      value = "Meta+${shifted.${numKey n}}"; }
  ]) desktops);

  # Plasma binds Meta+1..0 to task-manager entries by default; free them up.
  noTaskEntries = lib.listToAttrs (map (n: {
    name = "activate task manager entry ${toString n}";
    value = "none";
  }) desktops);
in
{
  programs.plasma = {
    kwin = {
      virtualDesktops = {
        number = 10;
        rows = 1;
      };

      scripts = {
        polonium = {
          enable = true;
          settings = {
          };
        };
      };
    };

    # Super + left-drag = move, Super + right-drag = resize
    configFile.kwinrc.MouseBindings = {
      CommandAllKey = "Meta";
      CommandAll1 = "Move";
      CommandAll3 = "Resize";
    };

    # ------------------------------------------------------------- launchers
    hotkeys.commands = {
      browser     = app "Zen"          "Meta+W"        "zen-beta";
      virt        = app "virt-manager" "Meta+Shift+W"  "virt-manager";
      files       = app "Dolphin"      "Meta+E"        "dolphin";
      terminal    = app "Kitty"        "Meta+T"        "kitty";
      feishin     = app "Feishin"      "Meta+M"        "feishin";
      spotify     = app "Spotify"      "Meta+Ctrl+M"   "spotify";
      steam       = app "Steam"        "Meta+Y"        "steam";

      # Media
      prev        = app "Previous track" "Meta+Ctrl+5" "playerctl previous";
      playpause   = app "Play/pause"     "Meta+Ctrl+6" "playerctl play-pause";
      next        = app "Next track"     "Meta+Ctrl+7" "playerctl next";
      mute        = app "Mute"           "Meta+Ctrl+8" "pactl set-sink-mute @DEFAULT_SINK@ toggle";
      volDown     = app "Volume down"    "Meta+Ctrl+9" "pactl set-sink-volume @DEFAULT_SINK@ -2%";
      volUp       = app "Volume up"      "Meta+Ctrl+0" "pactl set-sink-volume @DEFAULT_SINK@ +2%";
    };

    shortcuts = {
      kwin = {
        "Window Close"      = "Meta+Q";
        "Window Fullscreen" = "Meta+F";

        # Relative workspace switching / moving
        "Switch One Desktop to the Left"  = [ "Meta+Alt+Left"  "Meta+Alt+H" ];
        "Switch One Desktop to the Right" = [ "Meta+Alt+Right" "Meta+Alt+L" ];
        "Window One Desktop to the Left"  = [ "Meta+Shift+Alt+Left"  "Meta+Shift+Alt+H" ];
        "Window One Desktop to the Right" = [ "Meta+Shift+Alt+Right" "Meta+Shift+Alt+L" ];

        "Window to Next Screen" = "Meta+Shift+.";
        "Window to Previous Screen" = "Meta+Shift+,";
        "Switch to Next Screen" = "Meta+.";
        "Switch to Previous Screen" = "Meta+,";

        # Polonium specific actions
        "polonium: Focus Left"  = [ "Meta+Left" "Meta+H" ];
        "polonium: Focus Right" = [ "Meta+Right" "Meta+L" ];
        "polonium: Focus Above" = [ "Meta+Up" "Meta+K" ];
        "polonium: Focus Below" = [ "Meta+Down" "Meta+J" ];

        "polonium: Move Left"   = [ "Meta+Shift+Left" "Meta+Shift+H" ];
        "polonium: Move Right"  = [ "Meta+Shift+Right" "Meta+Shift+L" ];
        "polonium: Move Above"  = [ "Meta+Shift+Up" "Meta+Shift+K" ];
        "polonium: Move Below"  = [ "Meta+Shift+Down" "Meta+Shift+J" ];

        # Native layout adjustments
        "polonium: Toggle Window Floating" = "Meta+Space"; 

        "polonium: Cycle Engine Layout" = "Meta+Ctrl+Space";

        # Defaults that would shadow the binds above
        "Overview"     = "none";   # Meta+W
      } // desktopShortcuts;

      plasmashell = {
        "manage activities" = "none";   # Meta+Q
      } // noTaskEntries;

      "org.kde.plasma.emojier.desktop" = {
        "_launch" = "Meta+;";
      };

      ksmserver."Lock Session" = "Screensaver";  # drop Meta+L so Meta+L = focus right
    };
  };
}
