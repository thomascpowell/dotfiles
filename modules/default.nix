{ lib, ... }:

let
  inherit (builtins) filter;
  inherit (lib.filesystem) listFilesRecursive;
  inherit (lib) hasSuffix;
in

{
  imports = filter (file: file != ./default.nix && hasSuffix ".nix" file) (listFilesRecursive ./.);
  options.flake.homeModules = lib.mkOption {
    type = lib.types.lazyAttrsOf lib.types.raw;
    default = { };
  };
}
