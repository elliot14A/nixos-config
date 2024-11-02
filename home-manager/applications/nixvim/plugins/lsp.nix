{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      servers = {
        rust_analyzer = {
          enable = true;
          installRustc = false;
          installCargo = false;
          extraOptions = {
            settings = {
              "rust=analyzer" = {
                checkOnSave = {
                  command = "clippy";
                  allFeatures = true;
                };
                procMacro = {
                  enable = true;
                };
                hover = {
                    actions = {
                      enable = true;
                      debug = true;
                      gotoTypeDef = true;
                      implementations = true;
                    };
                  };
                  # Inline hints
                  inlayHints = {
                    bindingModeHints = {
                      enable = true;
                    };
                    closureReturnTypeHints = {
                      enable = true;
                    };
                    parameterHints = {
                      enable = true;
                    };
                    typeHints = {
                      enable = true;
                    };
                };
              };
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
      };
      keymaps = {
        silent = true;
        diagnostic = {
          # Navigate between diagnostic messages
          "<leader>lj" = "goto_next";
          "<leader>lk" = "goto_prev";
        };
        lspBuf = {
          # Go to definition
          gd = "definition";
          # Go to declaration
          gD = "declaration";
          # Show hover information
          K = "hover";
          # Go to implementation
          gi = "implementation";
          # Show signature help
          "<C-k>" = "signature_help";
          # Rename symbol
          "<leader>lr" = "rename";
          # Show code actions
          "<leader>la" = "code_action";
          # Go to references
          gr = "references";
          # Show document symbols
          "<leader>ds" = "document_symbol";
          # Show workspace symbols
          "<leader>ws" = "workspace_symbol";
        };
      };
    };

    lsp-lines.enable = true; 
    lspkind.enable = true; 
    trouble.enable = true;
  };
}
