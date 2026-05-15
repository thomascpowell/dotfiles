{ pkgs, config, ... }:

# Nix helpers

{
  home.packages = with pkgs; [
    nvd
    nix-output-monitor
    nh
    (writeShellScriptBin "hms" "home-manager switch --flake ~/dotfiles#${config.device.hostname}")
    (writeShellScriptBin "nrs" "nh os switch ~/dotfiles#${config.device.hostname}")
  ];
}
