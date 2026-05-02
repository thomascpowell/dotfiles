{ lib, ... }:

{
  options.devices = {
    trackpad = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
    };
    trackpoint = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
    };
    hostname = lib.mkOption {
      type = lib.types.str;
    };
  };
}
