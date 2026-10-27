# plasma-keybinds.nix
# Hyprland keybinds.lua -> plasma-manager (+ Krohnkite).
# Import from home.nix:  imports = [ ./plasma-keybinds.nix ];
#
# Untested. Action names were written from memory: verify with
#   nix run github:nix-community/plasma-manager#rc2nix
# and ~/.config/kglobalshortcutsrc if a binding does nothing.
{ lib, ... }:
let
  desktops = lib.range 1 10;
  numKey = n: if n == 10 then "0" else toString n;

  # Qt stores Shift+<digit> as the shifted symbol. This is the US layout;
  # change it to match your keyboard.
  shifted = {
    "1" = "!"; "2" = "@"; "3" = "#"; "4" = "$"; "5" = "%";
    "6" = "^"; "7" = "&"; "8" = "*"; "9" = "("; "0" = ")";
  };

  app = name: key: command: { inherit name key command; };

  # ---------------------------------------------------------------- screenshots
  # grimblast/grim need wlr-screencopy, which KWin doesn't implement.
  # Spectacle is the KDE-native capture tool; satty still does annotation.
  # (Your Lua had os.getenv("HOME") .. "Pictures/..." with no slash: fixed here.)
  shotDir = "$HOME/Pictures/Screenshots";
  stamp = "$(date +%Y%m%d-%H%M%S)";

  # ------------------------------------------------------- Krohnkite directions
  dirs = [
    { k = "Left";  arrow = "Left";  vim = "H"; size = "ShrinkWidth"; }
    { k = "Right"; arrow = "Right"; vim = "L"; size = "GrowWidth"; }
    { k = "Up";    arrow = "Up";    vim = "K"; size = "ShrinkHeight"; }
    { k = "Down";  arrow = "Down";  vim = "J"; size = "GrowHeight"; }
  ];

  krohnkite = lib.foldl' (acc: d: acc // {
    "KrohnkiteFocus${d.k}" = [ "Meta+${d.arrow}" "Meta+${d.vim}" ];
    "KrohnkiteShift${d.k}" = [ "Meta+Shift+${d.arrow}" "Meta+Shift+${d.vim}" ];
    "Krohnkite${d.size}"   = [ "Meta+Ctrl+${d.arrow}" "Meta+Ctrl+${d.vim}" ];
  }) { } dirs;

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
    kwin.virtualDesktops = {
      number = 10;
      rows = 1;
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

        # Floating toggle / "maximize" substitute.
        # The "force maximize = No" window rule makes native maximize a no-op,
        # so Meta+Shift+F toggles Krohnkite's monocle layout instead.
        "KrohnkiteToggleFloat"   = "Meta+Space";
        "KrohnkiteMonocleLayout" = "Meta+Shift+F";

        # Relative workspace switching / moving
        "Switch One Desktop to the Left"  = [ "Meta+Alt+Left"  "Meta+Alt+H" ];
        "Switch One Desktop to the Right" = [ "Meta+Alt+Right" "Meta+Alt+L" ];
        "Window One Desktop to the Left"  = [ "Meta+Shift+Alt+Left"  "Meta+Shift+Alt+H" ];
        "Window One Desktop to the Right" = [ "Meta+Shift+Alt+Right" "Meta+Shift+Alt+L" ];

        # Multi-screen (from the Krohnkite tips)
        "Switch to Next Screen"     = "Meta+.";
        "Switch to Previous Screen" = "Meta+,";
        "Window to Next Screen"     = "Meta+>";
        "Window to Previous Screen" = "Meta+<";

        # Defaults that would shadow the binds above
        "Show Desktop" = "none";   # Meta+D
        "Overview"     = "none";   # Meta+W
      } // desktopShortcuts // krohnkite;

      plasmashell = {
        "manage activities" = "none";   # Meta+Q
      } // noTaskEntries;

      ksmserver."Lock Session" = "Screensaver";  # drop Meta+L so Meta+L = focus right
    };
  };
}
