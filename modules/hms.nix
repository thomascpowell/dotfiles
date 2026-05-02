{ pkgs, config, ... }:

{
  home.packages = [
    (pkgs.writeShellScriptBin "hms" ''
      home-manager switch --flake ".#${config.devices.hostname}"
    '')
  ];
}
