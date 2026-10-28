{config, pkgs, ...}:

{
  programs.plasma = {

    powerdevil = {
      AC = {
        autoSuspend.action = "nothing";
        whenLaptopLidClosed = "nothing";
      };
      battery = {
        autoSuspend.action = "nothing";
        whenLaptopLidClosed = "nothing";
      };
      lowBattery = {
        autoSuspend.action = "nothing";
        whenLaptopLidClosed = "nothing";
      };
    };

    configFile = {
# Make logout happen immediately
      "ksmserverrc"."General" = {
        "confirmLogout" = false;
      };

      kwinrc.Windows = {
        FocusPolicy = "FocusFollowsMouse";
        DelayFocusInterval = 0;
      };
    };
  };
}
