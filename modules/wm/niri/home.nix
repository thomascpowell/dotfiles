{
  pkgs,
  ...
}:

# WM: Niri
# Home manager configurations

{
  home.packages = with pkgs; [
    xwayland-satellite
    libnotify
    wl-clipboard
    noctalia-shell
    brightnessctl
    playerctl

    (writeShellScriptBin "cb" "wl-copy")
    (writeShellScriptBin "rn" "(ps aux | grep quickshell | awk '{print $2}' | head -n1 | xargs kill) && noctalia-shell --daemonize")
    (writeShellScriptBin "niri_manage_output" ''
      selection=$(niri msg -j outputs | jq -r '.[] | [.name, (if .logical == null then "off" else "on" end)] | @tsv' | rofi -dmenu -p)
      [ -n "$selection" ] || exit 0
      output=$(printf '%s\n' "$selection" | cut -f1); state=$(printf '%s\n' "$selection" | cut -f2)
      [ "$state" = "on" ] && niri msg output "$output" off || niri msg output "$output" on
    '')
  ];

  imports = [
    ../shared/rofi.nix
    ../shared/grim.nix
  ];

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
