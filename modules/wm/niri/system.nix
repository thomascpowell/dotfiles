{
  pkgs,
  ...
}:

# WM: Niri
# NixOS configurations

{
  programs.niri.enable = true;
  systemd.user.services.niri.enableDefaultPath = false;

  services.upower.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
    config.common.default = [ "gnome" ];
  };
}
