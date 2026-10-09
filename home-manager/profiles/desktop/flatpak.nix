{config, ...}:

{
  services.flatpak.overrides = {
    "org.prismlauncher.PrismLauncher".Context = {
      filesystems = [
        "home"
      ];
    };
    "org.vinegarhq.Sober".Context = {
      filesystems = [
        "xdg-run/app/com.discordapp.Discord:create"
        "xdg-run/discord-ipc-0"
      ];
      devices = [ "input" ];
    };
  };
}
