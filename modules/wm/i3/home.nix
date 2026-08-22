{
  config,
  pkgs,
  lib,
  ...
}:

# WM: i3
# Home manager configurations

{
  home.packages = lib.optionals config.device.is_nixos (
    with pkgs;
    [
      i3blocks
      picom
      feh
      playerctl
      brightnessctl
      flameshot
      i3lock
      xdotool
      xinput
      xset
      xclip
      alsa-utils
    ]
  );

  imports = [
    ../shared/rofi.nix
    ./scripts.nix
  ];

  home.file.".config/i3/config".source = ../../../config/i3/config;
  home.file.".config/i3blocks/scripts".source = ../../../config/i3blocks/scripts;
  home.file.".config/i3blocks/config".text =
    let
      scripts = "${config.home.homeDirectory}/.config/i3blocks/scripts";
    in
    ''
      [global]
      interval=10
      markup=pango
      font=JetBrainsMono Nerd Font 12

      [bluetooth]
      command="${scripts}/bluetooth"
      interval=5

      [volume]
      # pipewire, pipewire pulse, pavucontrol
      command="${scripts}/volume"
      interval=5

      [brightness]
      command="${scripts}/brightness"
      interval=20

      [battery]
      command="${scripts}/battery"
      interval=20

      [time]
      command=date '+%m/%d %I:%M '
      interval=50
    '';
  home.file.".config/picom".source = ../../../config/picom;
  home.file.".config/i3/wallpaper.jpg".source = ../../../config/wall/mountain.jpg;

  home.file.".config/i3/inputs.conf".text =
    let
      lines =
        lib.optionals (config.device.trackpad_id != null) [
          ''exec_always --no-startup-id xinput --set-prop ${toString config.device.trackpad_id} "libinput Accel Speed" 0.7''
          ''exec_always --no-startup-id xinput --set-prop ${toString config.device.trackpad_id} "libinput Natural Scrolling Enabled" 1''
        ]
        ++ lib.optionals (config.device.trackpoint_id != null) [
          ''exec_always --no-startup-id xinput --set-prop ${toString config.device.trackpoint_id} "libinput Accel Speed" -0.4''
        ];
    in
    lib.concatStringsSep "\n" lines + "\n";

  home.file.".config/i3/keys.conf".text =
    let
      keys = config.keyboard;
      lines =
        lib.optional (
          keys.vol_mute != null
        ) "bindsym ${config.keyboard.vol_mute} exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ++ lib.optional (
          keys.vol_down != null
        ) "bindsym ${config.keyboard.vol_down} exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05-"
        ++ lib.optional (
          keys.vol_up != null
        ) "bindsym ${config.keyboard.vol_up} exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05+"
        ++ lib.optional (
          keys.mic_mute != null
        ) "bindsym ${config.keyboard.mic_mute} exec wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ++ lib.optional (
          keys.brightness_down != null
        ) "bindsym ${config.keyboard.brightness_down} exec brightnessctl set 2%-"
        ++ lib.optional (
          keys.brightness_up != null
        ) "bindsym ${config.keyboard.brightness_up} exec brightnessctl set +2%"
        ++ lib.optional (keys.screenshot != null) "bindsym Print exec flameshot gui";
    in
    lib.concatStringsSep "\n" lines + "\n";

  home.file.".Xresources".text =
    if config.device.dpi != null then "Xft.dpi: ${toString config.device.dpi}" else "";
}
