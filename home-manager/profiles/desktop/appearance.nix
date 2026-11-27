{osConfig, lib, inputs, pkgs, ...}:

{
  imports = [
    inputs.catppuccin.homeModules.catppuccin
  ];

  home.packages = with pkgs; [
    papirus-icon-theme
  ];

  catppuccin = {
    enable = true;
    autoEnable = true;
    flavor = "mocha";
    accent = "mauve";
    kvantum.enable = !(osConfig.desktop == "plasma");
  };
  
  qt = lib.mkIf (!(osConfig.desktop == "plasma")) {
    enable = true;
    platformTheme.name = "qt5ct";
    style.name = "kvantum";
  };
}
