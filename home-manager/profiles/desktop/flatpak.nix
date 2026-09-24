{config, ...}:

{
  services.flatpak.overrides = {
      "org.prismlauncher.PrismLauncher".Context = {
        filesystems = [
          "home"
        ];
    };
  };
}
