{ config, ... }:

let
  inherit (config.flake) homeModules nixosModules;
in

{
  hostModules.thinkpad.home = {
    imports = [
      homeModules.device
      homeModules.helpers
      homeModules.languages
      homeModules.slop
      homeModules.cli
      homeModules.desktop
      homeModules.niri
    ];

    home.username = "t";
    home.homeDirectory = "/home/t";
    home.stateVersion = "26.05";

    device.hostname = "thinkpad";
    device.is_nixos = true;
    device.dpi = 120;
  };

  hostModules.thinkpad.system =
    { pkgs, ... }:
    {
      imports = [
        ./hardware-configuration.nix
        nixosModules.printing
        nixosModules.niri
        nixosModules.fprint
        nixosModules.nix
      ];

      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;

      networking.hostName = "thinkpad";
      networking.firewall.enable = true;
      networking.networkmanager.enable = true;

      services.displayManager.ly.enable = true;

      programs.zsh.enable = true;

      security.rtkit.enable = true;

      services.mullvad-vpn.enable = true;
      services.tailscale.enable = true;

      time.timeZone = "America/New_York";

      services.pipewire = {
        enable = true;
        audio.enable = true;
        alsa.enable = true;
        pulse.enable = true;
      };

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

      users.users.t = {
        isNormalUser = true;
        description = "t";
        extraGroups = [
          "networkmanager"
          "wheel"
          "video"
        ];
        shell = pkgs.zsh;
      };

      environment.systemPackages = with pkgs; [
        git
        vim
        curl
        bash
        gcc
      ];

      system.stateVersion = "26.05";
    };
}
