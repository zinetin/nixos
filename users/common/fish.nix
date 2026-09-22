{config, ...}:

{
  programs.fish = {
    enable = true;
    shellAliases = {
      nix-fish = "nix-shell --run fish";
      nrs = "sudo nixos-rebuild switch --flake ~/.mynix/#(hostname)";
      nrb = "sudo nixos-rebuild boot --flake ~/.mynix/#(hostname)";
      bat-stat = "cat /sys/class/power_supply/BAT*/{capacity,status}";
    };
  };
}
