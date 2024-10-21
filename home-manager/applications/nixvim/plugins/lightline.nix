{
  programs.nixvim = {
    plugins.lightline = {
      enable = true;
      settings = {
        colorscheme = "wombat";
        active = {
          left = [
            [ "mode" "paste" ]
            [ "readonly" "filename" "modified" ]
          ];
          right = [
            [ "lineinfo" ]
            [ "percent" ]
            [ "fileformat" "fileencoding" "filetype" ]
          ];
        };
        component_function = {
          filename = "LightlineFilename";
        };
      };
    };
    extraConfigVim = ''
      function! LightlineFilename()
        return expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
      endfunction
    '';
  };
}
