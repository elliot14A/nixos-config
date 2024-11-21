{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      servers = {
        rust-analyzer = {
          installCargo = false;
          installRustc = false;
          enable = true;
          settings = {
            cargo = {
              loadOutDirsFromCheck = true;
              autoreload = true;
            };
            procMacro = {
              enable = true;
            };
            diagnostics = {
              enable = true;
              experimental = {
                enable = true;
              };
            };
            inlayHints = {
              bindingModeHints.enable = true;
              closureReturnTypeHints.enable = "always";
              discriminantHints.enable = "always";
              lifetimeElisionHints.enable = "always";
              typeHints.enable = true;
            };
          };
        };
        nixd = {
          enable = true;
          extraOptions = {
            settings = {
              nixd = {
                formatting = {
                  command = "nixpkgs-fmt";
                };
              };
            };
          };
        };
        gopls = {
          enable = true;
          settings = {
            gopls = {
              gofumpt = true;
              analyses = {
                unusedparams = true;
              };
              staticcheck = true;
            };
          };
        };
        ts_ls.enable = true;
        taplo.enable = true;
        nil_ls.enable = true;
        emmet_ls = {
          enable = true;
          filetypes = [
            "html"
            "css"
            "scss"
            "javascript"
            "javascriptreact"
            "typescript"
            "typescriptreact"
            "vue"
            "svelte"
          ];
        };
      };
      keymaps = {
        silent = true;
        diagnostic = {
          "<leader>lj" = "goto_next";
          "<leader>lk" = "goto_prev";
        };
        lspBuf = {
          gd = "definition";
          gD = "declaration";
          K = "hover";
          gi = "implementation";
          "<C-k>" = "signature_help";
          "<leader>lr" = "rename";
          "<leader>la" = "code_action";
          gr = "references";
          "<leader>ds" = "document_symbol";
          "<leader>ws" = "workspace_symbol";
        };
      };
    };
    lsp-lines.enable = true;
    lspkind.enable = true;
    trouble.enable = true;

    null-ls = {
      enable = true;
      sources = {
        formatting = {
          prettier = {
            enable = true;
            disableTsServerFormatter = true;
          };
        };
      };
    };
  };
}
