{ ... }:

# WM: i3
# NixOS configurations

{
  services.xserver = {
    enable = true;
    windowManager.i3.enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
  };
}
