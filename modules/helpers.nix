{ pkgs, config, ... }:

# Nix helpers

{
  home.packages = with pkgs; [
    nvd
    nix-output-monitor
    nh
    (writeShellScriptBin "hms" "nh home switch ~/dotfiles#${config.device.hostname}")
    (writeShellScriptBin "nrs" "nh os switch ~/dotfiles#${config.device.hostname}")
  ];
}
