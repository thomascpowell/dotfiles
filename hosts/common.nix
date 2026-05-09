{ ... }:

{
  imports = [
    ../modules/shell.nix
    ../modules/commands.nix
    ../modules/device.nix
    ../modules/keyboard.nix
  ];

  home.stateVersion = "26.05";

  home.sessionPath = [
    "$HOME/.nix-profile/bin"
  ];
}
