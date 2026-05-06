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
    type = lib.types.nullOr lib.types.int;
    default = null;
  };


  options.keyboard = {
    vol_mute = lib.mkOption {
      type = lib.types.str;
      default = "XF86AudioMute";
    };
    vol_down = lib.mkOption {
      type = lib.types.str;
      default = "XF86AudioLowerVolume";
    };
    vol_up = lib.mkOption {
      type = lib.types.str;
      default = "XF86AudioRaiseVolume";
    };
    mic_mute = lib.mkOption {
      type = lib.types.str;
      default = "XF86AudioMicMute";
    };

    brightness_down = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
    };
    brightness_up = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
    };

    screenshot = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
    };
  };
}
