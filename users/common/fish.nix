{config, ...}:

{
  programs.fish = {
    enable = true;
    shellAliases = {
      nix-fish = "nix-shell --run fish";
      nsr = "sudo nixos-rebuild switch --flake ~/.mynix/#(hostname)";
    };
  };
}
