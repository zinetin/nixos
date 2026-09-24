{config, pkgs, inputs, ...}:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs; };
    users.zinetin = import ../../home-manager/users/zinetin/home.nix;
    users.iridium = import ../../home-manager/users/iridium/home.nix;
    sharedModules = [ ../../home-manager/common/home.nix ];
  };

  # No password for sudo
  security.sudo.wheelNeedsPassword = false;

  # Define users
  users.users.zinetin = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "input" "docker" "libvirtd" "kvm" "plugdev"];
  };

  users.users.iridium = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "input" "docker" ]; # Enable ‘sudo’ for the user.
  };
}
