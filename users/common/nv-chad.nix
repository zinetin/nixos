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

    extraPlugins = ''
    return {
      {
        'mrcjkb/rustaceanvim',
        version = '^9',
        lazy = false,
      },

      {
        'rust-lang/rust.vim',
        ft = "rust",
        init = function()
          vim.g.rustfmt_autosave = 1
        end
      },

      {
        'saecki/crates.nvim',
        ft = {"toml"},
        config = function()
          require("crates").setup {
            completion = {
              cpm = {
                enabled = true
              },
            },
          }
          require('cmp').setup.buffer({
            sources = { { name = "crates" } }
          })
        end
      },
    }

    '';
  };
}
