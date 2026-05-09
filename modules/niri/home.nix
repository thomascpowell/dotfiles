{
  pkgs,
  ...
}:

# WM: Niri

{
  home.packages = with pkgs; [
    xwayland-satellite
    libnotify
    wl-clipboard
    noctalia-shell
    brightnessctl
  ];

  imports = [
    ../rofi.nix
  ];

  xdg.configFile."niri".source = ../../config/niri;

  services.polkit-gnome.enable = true;
  programs.swaylock.enable = true;

  gtk = {
    enable = true;

    theme = {
      name = "ll";
    };
  };

  services.swayidle = {
    enable = true;
    events = [
      {
        event = "before-sleep";
        command = "${pkgs.swaylock}/bin/swaylock --no-unlock-indicator --color #000000";
      }
      {
        event = "lock";
        command = "${pkgs.swaylock}/bin/swaylock --no-unlock-indicator --color #000000";
      }
    ];
    timeouts = [
      {
        timeout = 300;
        command = "${pkgs.swaylock}/bin/swaylock --no-unlock-indicator --color #000000";
      }
    ];
  };
}
