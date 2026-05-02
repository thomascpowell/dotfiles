{ pkgs, config, ... }:

{
  home.packages = [
    (pkgs.writeShellScriptBin "hms" ''
      home-manager switch --flake ".#${config.device.hostname}"
    '')
  ];
}
