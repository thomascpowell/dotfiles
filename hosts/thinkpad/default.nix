{ config, ... }:

let
  inherit (config.flake) homeModules nixosModules;
in

{
  hostModules.thinkpad.home = {
    imports = [
      homeModules.base
      # desktop
      homeModules.desktop
      # dev
      homeModules.slop
    ];

    device.hostname = "thinkpad";
    device.is_nixos = true;
    device.dpi = 120;
  };

  hostModules.thinkpad.system =
    { pkgs, ... }:
    {
      imports = [
        ./hardware-configuration.nix
        nixosModules.base
        nixosModules.desktop
        nixosModules.fprint
      ];

      boot.kernelPackages = pkgs.linuxPackages_latest;
      networking.hostName = "thinkpad";
      services.displayManager.ly.enable = true;
      security.rtkit.enable = true;
      services.mullvad-vpn.enable = true;

      services.pipewire = {
        enable = true;
        audio.enable = true;
        alsa.enable = true;
        pulse.enable = true;
      };

      # mute light nonsense
      services.udev.extraRules = ''
        ACTION=="add", SUBSYSTEM=="sound", KERNEL=="controlC*", ATTRS{id}=="sofsoundwire", RUN+="${pkgs.bash}/bin/sh -c 'echo rt1318-1 DAC Switch > /sys/class/sound/ctl-led/speaker/card%n/attach'"
      '';

      services.tlp.enable = true;
      services.tlp.settings = {
        RUNTIME_PM_ON_AC = "auto";
        CPU_ENERGY_PERF_POLICY_ON_AC = "power";
        PLATFORM_PROFILE_ON_AC = "balanced";
        CPU_BOOST_ON_AC = "0";
      };

      hardware.bluetooth = {
        enable = true;
        powerOnBoot = true;
      };

      users.users.t.extraGroups = [ "video" ];

      environment.systemPackages = with pkgs; [
        gcc
      ];
    };
}
