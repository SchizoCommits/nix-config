{
  home.keyboard = {
    layout = "us,il";
    options = [ "grp:lalt_lshift_toggle" ];
  };

  # i18n.inputMethod = {
  #   enabled = "fcitx5";
  #   fcitx5.addons = with pkgs; [ fcitx5-chinese-addons ];
  # };

  # xdg.dataFile."fcitx5/themes/Nord-Dark/" = {
  #   source = pkgs.fetchFromGitHub
  #     {
  #       owner = "tonyfettes";
  #       repo = "fcitx5-nord";
  #       rev = "bdaa8fb723b8d0b22f237c9a60195c5f9c9d74d1";
  #       sha256 = "sha256-qVo/0ivZ5gfUP17G29CAW0MrRFUO0KN1ADl1I/rvchE=";
  #     } + "/Nord-Dark";
  #   recursive = true;
  # };

  # xdg.configFile = {
  #   "fcitx5/conf/xcb.conf".text = "Allow Overriding System XKB Settings=False";
  #   "fcitx5/config".text = ''
  #     [Hotkey]
  #     TriggerKeys=
  #     EnumerateWithTriggerKeys=True
  #     AltTriggerKeys=
  #     EnumerateForwardKeys=
  #     EnumerateBackwardKeys=
  #     EnumerateSkipFirst=False
  #     EnumerateGroupForwardKeys=
  #     EnumerateGroupBackwardKeys=
  #     [Hotkey/ActivateKeys]
  #     0=Control+space
  #     [Hotkey/DeactivateKeys]
  #     0=Control+space
  #   '';
  #   "fcitx5/conf/classicui.conf".text = ''
  #     Font="JetBrains Mono 10"
  #     MenuFont="JetBrains Mono 10"
  #     TrayFont="JetBrains Mono Bold 10"
  #     Theme=Nord-Dark
  #   '';
  # };

  services.sxhkd = {
    enable = true;
    keybindings = {
      # terminal emulator
      "super + Return" = "alacritty";
      # program launcher
      "super + @space" = "rofi -show drun";
      # quit/restart bspwm
      "super + alt + {q,r}" = "bspc {quit,wm -r}";

      # close and kill
      "super + {_,shift + }w" = "bspc node -{c,k}";

      # alternate between the tiled and monocle layout
      "super + m" = "bspc desktop -l next";

      # send the newest marked node to the newest preselected node
      "super + y" = "bspc node newest.marked.local -n newest.!automatic.local";

      # swap the current node and the biggest node
      "super + g" = "bspc node -s biggest";

      # set the window state
      "super + {t,shift + t,s,f}" = "bspc node -t {tiled,pseudo_tiled,floating,fullscreen}";

      # set the node flags
      "super + ctrl + {m,x,y,z}" = "bspc node -g {marked,locked,sticky,private}";

      # focus the node in the given direction
      "super + {_,shift + }{h,j,k,l}" = "bspc node -{f,s} {west,south,north,east}";

      # focus the node for the given path jump
      "super + {p,b,comma,period}" = "bspc node -f @{parent,brother,first,second}";

      # focus the next/previous node in the current desktop
      "super + {_,shift + }c" = "bspc node -f {next,prev}.local.!hidden.window";

      # focus the next/previous desktop in the current monitor
      "super + bracket{left,right}" = "bspc desktop -f {prev,next}.local.!hidden.window";

      # focus the last node/desktop
      "super + {grave,Tab}" = "bspc {node,desktop} -f last";

      # focus or send to the given desktop
      "super + {_,shift + }{1-9,0}" = "bspc {desktop -f,node -d} '^{1-9,10}'";

      # preselect the direction
      "super + ctrl + {h,j,k,l}" = "bspc node -p {west,south,north,east}";

      # preselect the ratio
      "super + ctrl + {1-9}" = "bspc node -o 0.{1-9}";

      # cancel the preselection for the focused node
      "super + ctrl + space" = "bspc node -p cancel";

      # cancel the preselection for the focused desktop
      "super + ctrl + shift + space" = "bspc query -N -d | xargs -I id -n 1 bspc node id -p cancel";

      # move a floating window
      "super + {Left,Down,Up,Right}" = "bspc node -v {-20 0,0 20,0 -20,20 0}";

      # Rotate tree
      "super + shift + {d,a}" = "bspc node @/ -C {forward,backward}";

      #### MULTIMEDIA KEYS ####

      "XF86Audio{Prev,Next,Play}" = "mpc -q {prev,next,toggle}";

      "XF86Audio{Raise,Lower}Volume" = "pulsemixer --change-volume {+,-}5";

      "XF86AudioMute" = "pulsemixer --toggle-mute";

      "XF86AudioMicMute" = "pulsemixer --id source-42 --toggle-mute";

      # Launch programs
      "alt + 1" = "firefox";

      "alt + 2" = "Discord";

      "alt + 3" = "nemo";

      "alt + 4" = "alacritty -e ncmpcpp";

      "super + alt + m" = "rofi-mpd -a";

      # Screenshoting 
      "ctrl + Print" = "maim -s | xclip -selection clipboard -t image/png";

      "Print" = "maim | xclip -selection clipboard -t image/png && notify-send 'maim' 'Screenshot captured'";

    };
    extraConfig = ''
      # Expand/contract a window by moving one of its side outward/inward
      super + alt + {h,j,k,l}
          STEP=20; SELECTION={1,2,3,4}; \
          bspc node -z $(echo "left -$STEP 0,bottom 0 $STEP,top 0 -$STEP,right $STEP 0" | cut -d',' -f$SELECTION) || \
          bspc node -z $(echo "right -$STEP 0,top 0 $STEP,bottom 0 -$STEP,left $STEP 0" | cut -d',' -f$SELECTION)
    '';
  };
}

