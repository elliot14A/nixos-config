
{
  programs.nixvim = {

    plugins = {
      nvim-ufo = {
        enable = true;
        settings = {
          preview = {
            mappings = {
              scrollB = "<C-B>";
              scrollF = "<C-F>";
              scrollU = "<C-U>";
              scrollD = "<C-D>";
            };
          };
          provider_selector = {
            __raw = ''
              function(_, filetype, buftype)
                local function handleFallbackException(bufnr, err, providerName)
                  if type(err) == "string" and err:match "UfoFallbackException" then
                    return require("ufo").getFolds(bufnr, providerName)
                  else
                    return require("promise").reject(err)
                  end
                end
                return (filetype == "" or buftype == "nofile") and "indent" -- only use indent until a file is opened
                  or function(bufnr)
                    return require("ufo")
                      .getFolds(bufnr, "lsp")
                      :catch(function(err) return handleFallbackException(bufnr, err, "treesitter") end)
                      :catch(function(err) return handleFallbackException(bufnr, err, "indent") end)
                  end
              end
            '';
          };
        };
      };


      lsp = {
        onAttach = ''
          client.server_capabilities.textDocument = vim.tbl_deep_extend(
            "force",
            client.server_capabilities.textDocument or {},
            {
              foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true
              }
            }
          )
        '';
      };
    };

    extraConfigLua = ''
      -- Any additional setup for nvim-ufo can be added here
      require("ufo").setup()

      -- Optional: Add custom commands or additional configurations
      vim.o.foldcolumn = '1'
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
    '';

  };
}
