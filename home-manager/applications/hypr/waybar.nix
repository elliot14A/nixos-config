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
  programs.waybar = {
    enable = true;
    systemd = {
      enable = false; # disable it, autostart it in hyprland conf
      target = "graphical-session.target";
    };
    style = ''
      * {
          font-family: "FiraCode Nerd Font";
          font-size: 12pt;
          font-weight: bold;
          border-radius: 10px;
          transition-property: background-color;
          transition-duration: 0.5s;
      }
      @keyframes blink_red {
          to {
              background-color: ${gruvboxDark.red};
              color: ${gruvboxDark.fg0};
          }
      }
      .warning, .critical, .urgent {
          animation-name: blink_red;
          animation-duration: 1s;
          animation-timing-function: linear;
          animation-iteration-count: infinite;
          animation-direction: alternate;
      }
      window#waybar {
          background-color: transparent;
      }
      window > box {
          margin-left: 10px;
          margin-right: 10px;
          margin-top: 10px;
          background-color: ${gruvboxDark.bg0};
      }
      #workspaces {
          padding-left: 0px;
          padding-right: 4px;
      }
      #workspaces button {
          padding-top: 5px;
          padding-bottom: 5px;
          padding-left: 6px;
          padding-right: 6px;
          color: ${gruvboxDark.fg1};
      }
      #workspaces button.active {
          background-color: ${gruvboxDark.green};
          color: ${gruvboxDark.bg0};
      }
      #workspaces button.urgent {
          color: ${gruvboxDark.bg0};
      }
      #workspaces button:hover {
          background-color: ${gruvboxDark.yellow};
          color: ${gruvboxDark.bg0};
      }
      tooltip {
          background: ${gruvboxDark.bg1};
      }
      tooltip label {
          color: ${gruvboxDark.fg1};
      }
      #custom-launcher {
          font-size: 20px;
          padding-left: 8px;
          padding-right: 6px;
          color: ${gruvboxDark.blue};
      }
      #mode, #clock, #memory, #temperature,#cpu,#mpd, #custom-wall, #temperature, #backlight, #pulseaudio, #network, #battery, #custom-powermenu, #custom-cava-internal {
          padding-left: 10px;
          padding-right: 10px;
      }
      #memory {
          color: ${gruvboxDark.aqua};
      }
      #cpu {
          color: ${gruvboxDark.purple};
      }
      #clock {
          color: ${gruvboxDark.fg1};
      }
      #custom-wall {
          color: ${gruvboxDark.purple};
      }
      #temperature {
          color: ${gruvboxDark.blue};
      }
      #backlight {
          color: ${gruvboxDark.green};
      }
      #pulseaudio {
          color: ${gruvboxDark.yellow};
      }
      #network {
          color: ${gruvboxDark.green};
      }
      #network.disconnected {
          color: ${gruvboxDark.fg4};
      }
      #battery.charging, #battery.full, #battery.discharging {
          color: ${gruvboxDark.orange};
      }
      #battery.critical:not(.charging) {
          color: ${gruvboxDark.red};
      }
      #custom-powermenu {
          color: ${gruvboxDark.red};
      }
      #tray {
          padding-left: 10px;
          padding-right: 8px;
      }
      #tray menu {
          background: ${gruvboxDark.bg1};
          color: ${gruvboxDark.fg1};
      }
      #mpd.paused {
          color: ${gruvboxDark.fg4};
          font-style: italic;
      }
      #mpd.stopped {
          background: transparent;
      }
      #mpd {
          color: ${gruvboxDark.fg1};
      }
      #custom-cava-internal{
          font-family: "Hack Nerd Font" ;
      }
    '';
    settings = [{
      "layer" = "top";
      "position" = "top";
      "output" = "eDP-1";
      modules-left =
        [ "custom/launcher" "hyprland/workspaces" "temperature" "mpd" ];
      modules-center = [ "clock" ];
      modules-right = [
        "pulseaudio"
        "backlight"
        "memory"
        "cpu"
        "network"
        "battery"
        "custom/powermenu"
        "tray"
      ];
      "custom/launcher" = {
        "format" = " ";
        "on-click" = "fuzzel";
        "tooltip" = false;
      };
      "hyprland/workspaces" = {
        "format" = "{name}";
        "on-click" = "activate";
        "all-outputs" = "true";
      };
      "backlight" = {
        "device" = "intel_backlight";
        "on-scroll-up" = "light -A 5";
        "on-scroll-down" = "light -U 5";
        "format" = "{icon} {percent}%";
        "format-icons" = [ "󰃝" "󰃞" "󰃟" "󰃠" ];
      };

      "pulseaudio" = {
        "scroll-step" = 5;
        "format" = "{icon} {volume}%";
        "format-muted" = "󰖁 Muted";
        "format-icons" = {
          "default" = [ "" "" "" ];
        };
        "on-click" = "pamixer -t";
        "on-click-right" = "pavucontrol";
        "on-scroll-up" = "pamixer -i 5";
        "on-scroll-down" = "pamixer -d 5";
        "smooth-scrolling-threshold" = 1;
        "tooltip" = true;
        "tooltip-format" = "{desc} - {volume}%";
      };
      "battery" = {
        "interval" = 10;
        "states" = {
          "warning" = 20;
          "critical" = 10;
        };
        "format" = "{icon} {capacity}%";
        "format-icons" = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
        "format-full" = "{icon} {capacity}%";
        "format-charging" = "󰂄 {capacity}%";
        "tooltip" = false;
      };
      "clock" = {
        "interval" = 1;
        "format" = "{:%I:%M %p  %A %b %d}";
        "tooltip" = true;
        "tooltip-format" = "<tt>{calendar}</tt>";
      };
      "memory" = {
        "interval" = 1;
        "format" = "󰍛 {percentage}%";
        "states" = { "warning" = 85; };
      };
      "cpu" = {
        "interval" = 1;
        "format" = "󰻠 {usage}%";
      };
      "mpd" = {
        "max-length" = 25;
        "format" = "<span foreground='${gruvboxDark.purple}'></span> {title}";
        "format-paused" = " {title}";
        "format-stopped" = "<span foreground='${gruvboxDark.purple}'></span>";
        "format-disconnected" = "";
        "on-click" = "mpc --quiet toggle";
        "on-click-right" = "mpc update; mpc ls | mpc add";
        "on-click-middle" = "kitty --class='ncmpcpp' ncmpcpp";
        "on-scroll-up" = "mpc --quiet prev";
        "on-scroll-down" = "mpc --quiet next";
        "smooth-scrolling-threshold" = 5;
        "tooltip-format" =
          "{title} - {artist} ({elapsedTime:%M:%S}/{totalTime:%H:%M:%S})";
      };
      "network" = {
        "format-disconnected" = "󰯡 Disconnected";
        "format-ethernet" = "󰀂 {ifname} ({ipaddr})";
        "format-linked" = "󰖪 {essid} (No IP)";
        "format-wifi" = "󰖩 {essid}";
        "interval" = 1;
        "tooltip" = false;
      };
      "temperature" = {
        "tooltip" = false;
        "format" = " {temperatureC}°C";
      };
      "custom/powermenu" = {
        "format" = "";
        "on-click" = "wlogout";
        "tooltip" = false;
      };
      "tray" = {
        "icon-size" = 15;
        "spacing" = 5;
      };
    }];
  };
}
