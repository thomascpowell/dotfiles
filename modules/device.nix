{ lib, ... }:

# Extra device-specific information

{
  # Hostname
  options.device.hostname = lib.mkOption {
    type = lib.types.str;
  };

  # Optional: device ids for laptops
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

  # Optional: DPI
  options.device.dpi = lib.mkOption {
    type = lib.types.nullOr lib.types.int;
    default = null;
  };
}
