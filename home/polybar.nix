{ config, pkgs, ... }:
{
  services.polybar = {
    enable = true;
    package = pkgs.polybarFull;
    script = ''
      polybar centerbar &
      polybar rightbar &
      polybar leftbar &
    '';
    config = let colors = config.colorscheme.colors; in
      {
        "settings" = {
          "throttle-ms" = "50";
          "throttle-limit" = "5";
        };
        "colors" = {
          "black" = "#${colors.base01}";
          "red" = "#${colors.base08}";
          "green" = "#${colors.base0B}";
          "yellow" = "#${colors.base0A}";
          "blue" = "#${colors.base0F}";
          "magenta" = "#${colors.base0E}";
          "cyan" = "#${colors.base0C}";
          "white" = "#${colors.base05}";
          "black1" = "#${colors.base03}";
          "red1" = "#${colors.base09}";
          "green1" = "#${colors.base0B}";
          "yellow1" = "#${colors.base0A}";
          "blue1" = "#${colors.base0D}";
          "magenta1" = "#${colors.base0E}";
          "cyan1" = "#${colors.base07}";
          "white1" = "#${colors.base06}";
          "background" = "#${colors.base00}";
          "foreground" = "#${colors.base04}";
          "ctransp" = "#00FFFF";
        };

        "global/wm" = {
          "margin-top" = "-3";
          "margin-bottom" = "-3";
        };
        "section/base" = {
          "top" = "true";
          "padding-left" = "0";
          "spacing" = "0";
          "padding-right" = "0";
          "module-margin-left" = "0";
          "module-margin-right" = "0";
          "module-padding-left" = "0";
          "module-padding-right" = "0";
          "border-top-size" = "3";
          "border-left-size" = "3";
          "border-right-size" = "3";
          "border-bottom-size" = "3 ";
          "foreground" = "\${colors.foreground}";
          "background" = "\${colors.background}";
          "border-top-color" = "\${colors.black1}";
          "border-bottom-color" = "\${colors.black1}";
          "border-left-color" = "\${colors.black1}";
          "border-right-color" = "\${colors.black1}";
          "font-0" = "JetBrains Mono:size=9;2";
          "font-1" = "JetBrains Mono:size=9;2";
          "font-2" = "Font Awesome 5 Free Solid:size=9;2";
          "wm-restack" = "bspwm";
        };
        "bar/leftbar" = {
          "inherit" = "section/base";
          # Position
          "offset-x" = "10";
          "offset-y" = "7";
          # Size
          "width" = "223";
          "height" = "20";
          # Modules
          "modules-left" = "bspwm";
        };
        "module/bspwm" = {
          "type" = "internal/bspwm";
          "format" = "<label-state><label-mode>";
          "label-active" = "%index%";
          "label-active-padding" = "1";
          "label-active-font" = "1";
          "label-active-foreground" = "\${colors.black}";
          "label-active-background" = "\${colors.blue1}";
          "label-occupied" = "%index%";
          "label-occupied-padding" = "1";
          "label-occupied-font" = "1";
          "label-urgent" = "%index%";
          "label-urgent-padding" = "1";
          "label-urgent-background" = "\${colors.red}";
          "label-urgent-foreground" = "\${colors.red1}";
          "label-urgent-font" = "1";
          "label-empty" = "%index%";
          "label-empty-padding" = "1";
          "label-empty-font" = "1";
          "label-empty-foreground" = "\${colors.black1}";
          "label-empty-background" = "\${colors.black}";
          #Icon for non indexed WS
          "ws-icon-default" = "○";
        };
        "bar/centerbar" = {
          "inherit" = "section/base";
          # Position
          "offset-x" = "50%:-175";
          "offset-y" = "7";
          # Size;
          "width" = "350";
          "height" = "20";
          # Modules
          "modules-center" = "mpd";
        };
        "bar/rightbar" = {
          "inherit" = "section/base";
          # Position,
          "offset-x" = "100%:-293";
          "offset-y" = "7";
          # Size
          "width" = "283";
          "height" = "20";
          # Modules
          "modules-right" = "xkeyboard cpu memory pulseaudio date";
        };
        "module/date" = {
          "type" = "internal/date";
          "interval" = "1";
          "format" = "<label>";
          "format-padding" = "1";
          "format-foreground" = "\${colors.yellow}";
          "label" = " %date% %time%";
          "time" = "%H:%M";
          "date-alt" = "%A ";
          "date" = "%d";
        };
        "module/mpd" = {
          "type" = "internal/mpd";
          # Host where mpd is running (either ip or domain name)
          # Can also be the full path to a unix socket where mpd is running.
          "host" = "localhost";
          "port" = "6600";
          "format-foreground" = "\${colors.blue1}";
          "label-song" = "𝄞 %artist% - %title%";
          "format-online" = "<label-song>";
        };
        "module/pulseaudio" = {
          "type" = "internal/pulseaudio";
          "format-muted-background" = "\${colors.red}";
          "format-volume-foreground" = "\${colors.green}";
          "format-volume" = "<ramp-volume> <label-volume>";
          "format-muted" = "<label-muted>";
          "format-volume-padding" = "1";
          "format-muted-padding" = "1";
          "label-muted" = "MUTED";
          "ramp-volume-0" = "";
          "ramp-volume-1" = "";
          "ramp-volume-2" = "";
        };
        "module/memory" = {
          "type" = "internal/memory";
          # Seconds to sleep between updates
          # Default: 1
          "interval" = "1";
          "format" = "<label>";
          "label" = " %percentage_used%%";
          "format-foreground" = "\${colors.red1}";
          "format-padding" = "1";
        };
        "module/cpu" = {
          "type" = "internal/cpu";
          # Seconds to sleep between updates
          # Default: 1
          "interval" = "1";
          "label" = " %percentage%%";
          "format-foreground" = "\${colors.magenta}";
          "format-padding" = "1";
        };
        "module/xkeyboard" = {
          "type" = "internal/xkeyboard";
          "blacklist-0" = "num lock";
          "label-layout" = "%layout%";
          "format-foreground" = "\${colors.cyan1}";
        };
      };
  };
}

