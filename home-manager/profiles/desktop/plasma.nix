{pkgs, ...}:

{
  home.packages = with pkgs.kdePackages; [
    krohnkite
  ];

  programs.plasma = {
    enable = true;
    overrideConfig = true;

    workspace = {
      colorScheme = "BreezeDark";
    };

    configFile = {
      kwinrc.Plugins.krohnkiteEnabled = true;
    };
  };
}
