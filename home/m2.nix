{ ... }:

{
  home.username = "t";
  home.homeDirectory = "/Users/t";

  imports = [ 
    ./common.nix
    ../modules/colima.nix
  ];
  home.file.".config/ghostty".source = ../config/ghostty;
  home.file.".config/aerospace".source = ../config/aerospace;
}
