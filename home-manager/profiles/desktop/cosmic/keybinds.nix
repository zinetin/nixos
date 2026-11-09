{ cosmicLib, lib, ... }:
let
  inherit (cosmicLib.cosmic) mkRON;

  # Unit variant, e.g. Close
  unit = variant: mkRON "enum" variant;
  # Tuple variant, e.g. Spawn("kitty"), Focus(Left), Workspace(3)
  tuple = variant: args: mkRON "enum" { inherit variant; value = args; };

  bind = key: action: description: {
    inherit key action;
    description = mkRON "optional" description;
  };

  spawn = key: description: command:
    bind key (tuple "Spawn" [ command ]) description;

  numKey = n: if n == 10 then "0" else toString n;

  directions = [
    { dir = "Left";  arrow = "Left";  vim = "h"; }
    { dir = "Right"; arrow = "Right"; vim = "l"; }
    { dir = "Up";    arrow = "Up";    vim = "k"; }
    { dir = "Down";  arrow = "Down";  vim = "j"; }
  ];

  # Focus (Super+dir) and move (Super+Shift+dir), arrows and vim keys
  directionBinds = lib.concatMap (d:
    lib.concatMap (k: [
      (bind "Super+${k}"       (tuple "Focus" [ (unit d.dir) ]) "Focus ${d.dir}")
      (bind "Super+Shift+${k}" (tuple "Move"  [ (unit d.dir) ]) "Move window ${d.dir}")
    ]) [ d.arrow d.vim ]
  ) directions;

  # Super+N -> workspace N, Super+Shift+N -> move window to workspace N
  workspaceBinds = lib.concatMap (n: [
    (bind "Super+${numKey n}"       (tuple "Workspace"       [ n ]) "Workspace ${toString n}")
    (bind "Super+Shift+${numKey n}" (tuple "MoveToWorkspace" [ n ]) "Move window to workspace ${toString n}")
  ]) (lib.range 1 10);

  # Relative workspace switching / moving
  relativeWorkspaceBinds = lib.concatMap (k: [
    (bind "Super+Alt+${k.key}"       (unit k.switch) "Workspace ${k.label}")
    (bind "Super+Shift+Alt+${k.key}" (unit k.move)   "Move window to ${k.label} workspace")
  ]) [
    { key = "Left";  label = "Prev"; switch = "PreviousWorkspace"; move = "MoveToPreviousWorkspace"; }
    { key = "h";     label = "Prev"; switch = "PreviousWorkspace"; move = "MoveToPreviousWorkspace"; }
    { key = "Right"; label = "Next";     switch = "NextWorkspace";     move = "MoveToNextWorkspace"; }
    { key = "l";     label = "Next";     switch = "NextWorkspace";     move = "MoveToNextWorkspace"; }
  ];
in
{
  wayland.desktopManager.cosmic.shortcuts =
    [
      # ---------------------------------------------------------- launchers
      (spawn "Super+w"        "Browser"        "zen-beta")
      (spawn "Super+Shift+w"  "virt-manager"   "virt-manager")
      (spawn "Super+e"        "Files"          "dolphin")
      (spawn "Super+t"        "Terminal"       "kitty")
      (spawn "Super+m"        "Feishin"        "feishin")
      (spawn "Super+Ctrl+m"   "Spotify"        "spotify")
      (spawn "Super+y"        "Steam"          "steam")

      # -------------------------------------------------------------- media
      (spawn "Super+Ctrl+5" "Previous track" "playerctl previous")
      (spawn "Super+Ctrl+6" "Play/pause"     "playerctl play-pause")
      (spawn "Super+Ctrl+7" "Next track"     "playerctl next")
      (spawn "Super+Ctrl+8" "Mute"           "pactl set-sink-mute @DEFAULT_SINK@ toggle")
      (spawn "Super+Ctrl+9" "Volume down"    "pactl set-sink-volume @DEFAULT_SINK@ -2%")
      (spawn "Super+Ctrl+0" "Volume up"      "pactl set-sink-volume @DEFAULT_SINK@ +2%")

      # ------------------------------------------------------------ windows
      (bind "Super+q"     (unit "Close")                "Close window")
      (bind "Super+f"     (unit "Fullscreen")           "Fullscreen")
      (bind "Super+space" (unit "ToggleTiling") "Toggle floating")
      (bind "Super+Ctrl+space"  (unit "ToggleOrientation") "Toggle tiling orientation")

      # ------------------------------------------------------------ monitors
      (bind "Super+period"      (tuple "SwitchOutput" [ (unit "Right") ]) "Focus next screen")
      (bind "Super+comma"       (tuple "SwitchOutput" [ (unit "Left") ])  "Focus previous screen")
      (bind "Super+Shift+period" (tuple "MoveToOutput" [ (unit "Right") ]) "Window to next screen")
      (bind "Super+Shift+comma"  (tuple "MoveToOutput" [ (unit "Left") ])  "Window to previous screen")
    ]
    ++ directionBinds
    ++ workspaceBinds
    ++ relativeWorkspaceBinds;
}
