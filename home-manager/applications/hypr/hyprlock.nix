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
  programs.hyprlock.enable = true;
  programs.hyprlock.settings = {
    "$monitor" = "";
    general = { };
    background = {
      monitor = "$monitor";
      path = "~/Pictures/Wallpapers/wallpaper.jpg";
      blur_passes = 3;
      blur_size = 4;
    };
    input-field = {
      monitor = "$monitor";
      size = "250, 60";
      outline_thickness = 2;
      dots_size = 0.2;
      dots_spacing = 0.35;
      dots_center = true;
      outer_color = "rgba(40, 40, 40, 0)"; # bg0 with 0 alpha
      inner_color = "rgba(251, 241, 199, 0.2)"; # fg0 with 0.2 alpha
      font_color = "${gruvboxDark.fg1}";
      fade_on_empty = false;
      placeholder_text = ''<i><span style="italic" color="${gruvboxDark.fg4}"></span></i>'';
      hide_input = false;
      rounding = -1;
      fail_color = "${gruvboxDark.red}";
      fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
      fail_transition = 300;
      position = "0, 0";
      halign = "center";
      valign = "center";
    };
    label = [
      # Date
      {
        monitor = "$monitor";
        text = ''cmd[update:1000] echo "$(date +"%A, %B %d")"'';
        color = "${gruvboxDark.fg2}";
        font_size = 22;
        font_family = "FiraCode Nerd Font";
        position = "0, 75";
        halign = "center";
        valign = "center";
      }
      # Time
      {
        monitor = "$monitor";
        text = ''cmd[update:1000] echo "$(date +"%-I:%M")"'';
        color = "${gruvboxDark.fg0}";
        font_size = 95;
        font_family = "FiraCode Nerd Font";
        position = "0, 150";
        halign = "center";
        valign = "center";
      }
      # # User
      # {
      #   monitor = "$monitor";
      #   text = "Hi there, $USER";
      #   color = "${gruvboxDark.fg1}";
      #   font_size = 14;
      #   font_family = "Geist";
      #   position = "0, 10";
      #   halign = "center";
      #   valign = "center";
      # }
      # {
      #   monitor = "$monitor";
      #   text = "Life is all about Formality";
      #   text_align = "center";
      #   color = "${gruvboxDark.fg3}";
      #   font_size = 15;
      #   font_family = "Geist";
      #   rotate = 0;
      #   position = "-50, 80";
      #   halign = "right";
      #   valign = "bottom";
      # }
      # {
      #   monitor = "$monitor";
      #   text = "$LAYOUT";
      #   text_align = "center";
      #   color = "${gruvboxDark.fg3}";
      #   font_size = 15;
      #   font_family = "GeistMono Nerd Font";
      #   rotate = 0;
      #   position = "-50, 60";
      #   halign = "right";
      #   valign = "bottom";
      # }
    ];
  };
}
