{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  networking.hostName = "thinkpad";
  networking.networkmanager = {
    enable = true;
    wifi.powersave = false;
    wifi.backend = "iwd";
  };

  time.timeZone = "America/New_York";

  services.pipewire = {
    enable = true;
    audio.enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  services.xserver = {
    enable = true;
    windowManager.i3.enable = true;
  };

  services.displayManager.ly.enable = true;

  security.rtkit.enable = true;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
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

  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    git
    vim
    curl
    bash
    gcc
  ];

  system.stateVersion = "26.05";
}
