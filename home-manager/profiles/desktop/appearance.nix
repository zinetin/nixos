{...}:

{
  home.packages = with pkgs; [
    kvantum-themes
    papirus-icon-theme
  ];

  qt = {
    enable = true;
    platformTheme.name = "qt6ct";
    style.name = "kvantum";
  };

  
  xdg.configFile."Kvantum/kvantum.kvconfig".text = ''
    [General]
    theme=KvLibadwaitaDark
  '';

  xdg.configFile."qt6ct/qt6ct.conf".text = ''
    [Appearance]
    icon_theme=Papirus-Dark
    style=kvantum
  '';
}
