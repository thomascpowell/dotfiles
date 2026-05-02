{ ... }:

{
  imports = [
    ../modules/shell.nix
    ../modules/hms.nix
    ../modules/device.nix
  ];

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  home.file.".config/mpv".source = ../config/mpv;
  home.file.".config/zathura".source = ../config/zathura;

  home.sessionPath = [
    "$HOME/.nix-profile/bin"
  ];
}
