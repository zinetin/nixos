{config, ...}:

{
  programs.fish = {
    shellAliases = {
      nix-fish = "nix-shell --run fish";
      nsr = "sudo nixos-rebuild switch --flake ~/.mynix/#(hostname)";
    };
  };
}
