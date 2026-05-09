{
  pkgs,
  config,
  lib,
  ...
}:

# GUI applications

{
  home.packages = lib.optionals config.device.is_nixos (
    with pkgs;
    [
      librewolf
      mpv-unwrapped
      zathura
      kitty
      ghostty
    ]
  );

  home.file.".config/kitty".source = ../config/kitty;
  home.file.".config/mpv".source = ../config/mpv;
  home.file.".config/zathura".source = ../config/zathura;
  home.file.".config/ghostty".source = ../config/ghostty;
}
