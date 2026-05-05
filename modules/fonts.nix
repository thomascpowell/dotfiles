{
  config,
  pkgs,
  lib,
  ...
}:

# Fonts

{
  home.packages = lib.optionals config.device.is_nixos (
    with pkgs;
    [
      nerd-fonts.jetbrains-mono
    ]
  );

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      serif = [
        "SF Pro Text"
        "SF Pro Display"
        "Apple Color Emoji"
      ];
      sansSerif = [
        "SF Pro Text"
        "SF Pro Display"
        "Apple Color Emoji"
      ];
      monospace = [
        "JetBrainsMono Nerd Font Mono"
        "Apple Color Emoji"
      ];
      emoji = [ "Apple Color Emoji" ];
    };
  };
}
