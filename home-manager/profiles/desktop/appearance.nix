{inputs, pkgs, ...}:

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
  };
  
  qt = {
    enable = true;
    platformTheme.name = "qt5ct";
    style.name = "kvantum";
  };
}
