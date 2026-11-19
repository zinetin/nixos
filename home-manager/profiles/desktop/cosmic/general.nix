{config, cosmicLib, inputs, ...}:

{
  wayland.desktopManager.cosmic = {
    compositor = {
      focus_follows_cursor = true;
      focus_follows_cursor_delay = 10;
      cursor_follows_focus = true;   # true warps the cursor to the focused window
        autotile = true;
      autotile_behavior = cosmicLib.cosmic.mkRON "enum" "PerWorkspace";
    };

    idle = {
      suspend_on_ac_time = null;
      suspend_on_battery_time = null;
    };
  };
}
