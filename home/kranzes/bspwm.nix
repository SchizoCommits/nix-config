{ pkgs, ... }:

{
  home.pointerCursor = {
    package = pkgs.gnome.adwaita-icon-theme;
    name = "Adwaita";
    size = 24;
    x11.enable = true;
    gtk.enable = true;
  };

  xsession = {
    enable = true;
    windowManager.bspwm = {
      enable = true;
      settings = {
        remove_disabled_monitors = true;
        remove_unplugged_monitors = true;
        focused_border_color = "#88C0D0";
        border_width = 2;
        window_gap = 15;
      };
      rules = {
        "Zathura" = {
          state = "tiled";
        };
      };
    };
  };
}
