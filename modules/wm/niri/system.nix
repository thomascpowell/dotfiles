{
  pkgs,
  ...
}:

# WM: Niri

{
  programs.niri.enable = true;
  systemd.user.services.niri.enableDefaultPath = false;

  # services.dbus.enable = true;
  services.upower.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
    config.common.default = [ "gnome" ];
  };
}
