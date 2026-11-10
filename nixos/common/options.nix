{config, lib, ...}:

{
  options = {
    desktop = lib.mkOption {
      type = lib.types.enum [ "cosmic" "plasma" "halley" "iridium" ];
      default = "cosmic";
    };
  };

  config = {
    specialisation.plasma.configuration = {
      desktop = lib.mkForce "plasma";
    };
  };
}
