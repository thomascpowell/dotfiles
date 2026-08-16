{ pkgs, ... }:

# Grim setup

{
  home.packages = with pkgs; [
    grim
    slurp
    satty
    wl-clipboard

    (pkgs.writeShellScriptBin "screenshot" ''
      set -e

      grim -t ppm -g "$(slurp -d)" - |
        satty \
          --filename - \
          --copy-command wl-copy \
          --actions-on-enter "save-to-clipboard,exit" \
          --actions-on-escape "exit" \
          --disable-notifications
    '')
  ];
}
