{inputs, pkgs, ...}:

{
  imports = [
    inputs.nix4nvchad.homeManagerModules.default
  ];

  programs.nvchad = {
    enable = true;
    backup = false;

    extraPackages = with pkgs; [
      rust-analyzer
      rustfmt
      vscode-extensions.vadimcn.vscode-lldb
    ];

    chadrcConfig = builtins.readFile ./nvchad/chadrc.lua;

    extraPlugins = builtins.readFile ./nvchad/extraPlugins.lua;
  };
}
