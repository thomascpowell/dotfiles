{
  config,
  pkgs,
  lib,
  ...
}:

# Menu

{
  home.packages = lib.optionals config.device.is_nixos [ (lib.lowPrio pkgs.rofi) ];

  home.file.".config/rofi/theme.rasi".source = ../config/rofi/theme.rasi;

  home.file.".config/rofi/config.rasi".text = ''
    configuration {
      modi: "drun,run,window";
      show-icons: false;
      dpi: ${toString config.device.dpi};
    }
    @theme "theme"
  '';
}
