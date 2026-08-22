{ ... }:

# Home Manager modules for Linux Desktop

{
  imports = [
    ./xdg.nix
    ./theme.nix
    ./fonts.nix
    ./keyboard.nix
  ];
}
