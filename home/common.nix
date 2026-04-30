{ pkgs, ... }:

{
  imports = [
    ../modules/shell.nix
  ];

  home.stateVersion = "26.05";


  home.file.".config/mpv".source = ../config/mpv;
  home.file.".config/zathura".source = ../config/zathura;

  home.sessionPath = [
    "$HOME/.nix-profile/bin"
  ];

}
