{config, pkgs, ...}:

{
  programs.plasma = {

    powerdevil = {
      AC = {
        autoSuspend.action = "nothing";
        whenLaptopLidClosed = "doNothing";
      };
      battery = {
        autoSuspend.action = "nothing";
        whenLaptopLidClosed = "doNothing";
      };
      lowBattery = {
        autoSuspend.action = "nothing";
        whenLaptopLidClosed = "doNothing";
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
