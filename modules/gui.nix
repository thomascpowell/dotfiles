{
  pkgs,
  config,
  lib,
  ...
}:

# General GUI applications

{
  home.packages = lib.optionals config.device.is_nixos (
    with pkgs;
    [
      kitty
      ghostty

      mpv-unwrapped
      imv
      zathura

      keepassxc
      ungoogled-chromium
    ]
  );

  home.file.".config/ghostty".source = ../config/ghostty;
  home.file.".config/kitty".source = ../config/kitty;

  home.file.".config/mpv".source = ../config/mpv;
  home.file.".config/imv".source = ../config/imv;
  home.file.".config/zathura".source = ../config/zathura;

  programs.librewolf = {
    enable = true;

    profiles.default = {
      id = 0;
      isDefault = true;

      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "privacy.resistFingerprinting" = false;
      };

      userChrome = builtins.readFile ../config/firefox/userChrome.css;
    };
  };
}
