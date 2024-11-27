{ ... }:
let
  gruvboxDark = {
    bg0 = "#282828";
    bg1 = "#3c3836";
    bg2 = "#504945";
    bg3 = "#665c54";
    bg4 = "#7c6f64";
    fg0 = "#fbf1c7";
    fg1 = "#ebdbb2";
    fg2 = "#d5c4a1";
    fg3 = "#bdae93";
    fg4 = "#a89984";
    red = "#cc241d";
    green = "#98971a";
    yellow = "#d79921";
    blue = "#458588";
    purple = "#b16286";
    aqua = "#689d6a";
    orange = "#d65d0e";
  };
in
{
  programs.kitty = {
    enable = true;
    settings = {
      font_family = "FiraCode Nerd Font";
      font_size = 12;
      background = gruvboxDark.bg0;
      foreground = gruvboxDark.fg1;
      selection_background = gruvboxDark.bg3;
      selection_foreground = gruvboxDark.fg0;
      cursor = gruvboxDark.fg0;
      color0 = gruvboxDark.bg0;
      color1 = gruvboxDark.red;
      color2 = gruvboxDark.green;
      color3 = gruvboxDark.yellow;
      color4 = gruvboxDark.blue;
      color5 = gruvboxDark.purple;
      color6 = gruvboxDark.aqua;
      color7 = gruvboxDark.fg4;
      color8 = gruvboxDark.bg4;
      color9 = gruvboxDark.red;
      color10 = gruvboxDark.green;
      color11 = gruvboxDark.yellow;
      color12 = gruvboxDark.blue;
      color13 = gruvboxDark.purple;
      color14 = gruvboxDark.aqua;
      color15 = gruvboxDark.fg1;
      # Added padding settings
      window_padding_width = "5";
      window_margin_width = "5";
    };
  };
}
