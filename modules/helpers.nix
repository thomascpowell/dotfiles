{
  pkgs,
  config,
  lib,
  ...
}:

# Nix helpers

{
  home.packages =
    with pkgs;
    [
      nvd
      nix-output-monitor
      nh
      (writeShellScriptBin "hms" "home-manager switch --flake ${lib.escapeShellArg config.device.dotfiles_path}#${config.device.hostname}")
      (writeShellScriptBin "ns" "nix shell nixpkgs#$1")
    ]
    ++ lib.optionals config.device.is_nixos [
      (writeShellScriptBin "nrs" "nh os switch ${lib.escapeShellArg config.device.dotfiles_path}#${config.device.hostname}")
    ];
}
