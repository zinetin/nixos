{cosmicLib, config, inputs, pkgs, ...}:

let
  inherit (cosmicLib.cosmic) mkRON;
in 
{
  wayland.desktopManager.cosmic = {
    wallpapers = [
      {  
        output = "all";
        source = mkRON "enum" {
          variant = "Path";
          value = [ "${inputs.wallpapers.packages.${pkgs.stdenv.hostPlatform.system}.default}/paint-skyline.webp" ];
        };
        filter_by_theme = false;
        filter_method = mkRON "enum" "Lanczos";
        sampling_method = mkRON "enum" "Alphanumeric";
        scaling_mode = mkRON "enum" "Zoom";
        rotation_frequency = 300;
      }
    ];
    panels = [
      {
        name = "Panel";
        anchor = mkRON "enum" "Left";
        anchor_gap = false;
        margin = 0;
        output = mkRON "enum" "All";
        size = mkRON "enum" "S";
        expand_to_edges = true;
        opacity = 1.0;
        padding = 0;
        spacing = 2;
        border_radius = 0;
        exclusive_zone = true;
  
        plugins_wings = mkRON "optional" (mkRON "tuple" [
            [
            "com.system76.CosmicPanelWorkspacesButton"
            "com.system76.CosmicPanelAppButton"
            ]
            [
            "com.system76.CosmicAppletA11y"
            "com.system76.CosmicAppletInputSources"
            "com.system76.CosmicAppletStatusArea"
            "com.system76.CosmicAppletTiling"
            "com.system76.CosmicAppletAudio"
            "com.system76.CosmicAppletNetwork"
            "com.system76.CosmicAppletBluetooth"
            "com.system76.CosmicAppletBattery"
            "com.system76.CosmicAppletNotifications"
            "com.system76.CosmicAppletPower"
            ]
        ]);
        plugins_center = mkRON "optional" [ "com.system76.CosmicAppletTime" ];
      }
    ];
  };
}
