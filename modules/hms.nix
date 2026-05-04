{ pkgs, config, ... }:

# Alias for running home-manager switch

{
  home.packages = [
    (pkgs.writeShellScriptBin "hms" "home-manager switch --flake .#${config.device.hostname}")
  ];
}
