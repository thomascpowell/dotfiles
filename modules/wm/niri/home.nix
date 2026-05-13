{
  pkgs,
  ...
}:

# WM: Niri

{
  home.packages = with pkgs; [
    xwayland-satellite
    libnotify
    wl-clipboard
    noctalia-shell
    brightnessctl
    playerctl

    (writeShellScriptBin "cb" "wl-copy")
  ];

  imports = [ ../../rofi.nix ];

  xdg.configFile."niri".source = ../../../config/niri;
  xdg.configFile."noctalia/colors.json".source = ../../../config/noctalia/colors.json;
  xdg.configFile."noctalia/settings.json".source = ../../../config/noctalia/settings.json;

  services.polkit-gnome.enable = true;
  programs.swaylock.enable = true;

  gtk = {
    enable = true;
    theme = {
      name = "ll";
    };
  };
}
