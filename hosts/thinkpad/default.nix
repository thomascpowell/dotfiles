{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/printing.nix
    ../../modules/wm/niri/system.nix
    ../../modules/wm/i3/system.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  networking.hostName = "thinkpad";
  networking.firewall.enable = true;
  networking.networkmanager.enable = true;

  services.displayManager.ly.enable = true;

  programs.zsh.enable = true;

  security.rtkit.enable = true;

  services.mullvad-vpn.enable = true;
  services.tailscale.enable = true;

  services.fprintd.enable = true;
  security.pam.services.ly.fprintAuth = false;
  security.pam.services.sudo.fprintAuth = true;
  security.pam.services.swaylock.fprintAuth = true;

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
}
