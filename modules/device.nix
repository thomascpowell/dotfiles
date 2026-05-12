{ lib, ... }:

# Extra device-specific information

{

  options.device.is_nixos = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };

  options.device.hostname = lib.mkOption {
    type = lib.types.str;
  };

  options.device = {
    trackpad_id = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
    };
    trackpoint_id = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
    };
  };

  options.device.dpi = lib.mkOption {
    type = lib.types.int;
    default = 96;
  };
}
