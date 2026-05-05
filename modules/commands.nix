{ pkgs, config, ... }:

# Scripts for running Nix commands

{
  home.packages = [
    (pkgs.writeShellScriptBin "hms" "home-manager switch --flake .#${config.device.hostname}")
    (pkgs.writeShellScriptBin "nrs" "nixos-rebuild switch --flake .#${config.device.hostname}")
  ];
}
