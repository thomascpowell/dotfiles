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
      mpv-unwrapped
      zathura
      kitty
      ghostty
      keepassxc
      ungoogled-chromium
    ]
  );

  home.file.".config/kitty".source = ../config/kitty;
  home.file.".config/mpv".source = ../config/mpv;
  home.file.".config/zathura".source = ../config/zathura;
  home.file.".config/ghostty".source = ../config/ghostty;

  programs.librewolf = {
    enable = true;

    profiles.default = {
      id = 0;
      isDefault = true;

      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "privacy.resistFingerprinting" = false;
      };

      userChrome = builtins.readFile ../misc/firefox/userChrome.css;
    };
  };
}
