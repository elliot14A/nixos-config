{
  programs.nixvim.plugins.lualine = {
    enable = true;
    sections = {
      lualine_a = [ "mode" ];
      lualine_b = [ "branch" "diff" "diagnostics" ];
      lualine_c = [ "filename" ];
      lualine_x = [
        {
          name = "diagnostics";
          extraConfig = {
            sources = [ "nvim_diagnostic" ];
          };
        }
        {
          name = "lsp_progress";
          extraConfig = {
            display_components = [ "lsp_client_name" "spinner" ];
            spinner_symbols = [ "⠋" "⠙" "⠹" "⠸" "⠼" "⠴" "⠦" "⠧" "⠇" "⠏" ];
          };
        }
      ];
      lualine_y = [ "encoding" "fileformat" "filetype" ];
      lualine_z = [ "location" ];
    };
  };
}
