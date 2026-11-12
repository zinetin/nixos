{config, lib, ...}:

{
  options = {
    desktop = lib.mkOption {
      type = lib.types.enum [ "cosmic" "plasma" "halley" "iridium" "cinnamon" ];
      default = "cosmic";
    };
  };

  config = {
    specialisation.plasma.configuration = {
      desktop = lib.mkForce "plasma";
    };
    specialisation.cinnamon.configuration = {
      desktop = lib.mkForce "cinnamon";
    };

  };
}
