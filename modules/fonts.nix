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
      inter
    ]
  );

  home.file.".local/share/fonts/AppleColorEmoji.ttf".source = ../misc/data/emoji.ttf;

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      serif = [
        "Inter"
        "Apple Color Emoji"
      ];
      sansSerif = [
        "Inter"
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
