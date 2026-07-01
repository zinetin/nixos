{config, pkgs, ...}:

{
  # No password for sudo
  security.sudo.wheelNeedsPassword = false;

  # Define users
  users.users.zinetin = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "input" "docker" ]; # Enable ‘sudo’ for the user.
  };

  users.users.testing = {
    isNormalUser = "true";
    extraGroups = [ "wheel" "networkmanager" "video" "input" "docker" ];
  }
}
