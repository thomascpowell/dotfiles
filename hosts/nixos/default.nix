{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix 
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  services.xserver = {
    enable = true;
    windowManager.i3.enable = true;
  };

  services.displayManager.ly.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  users.users.t = {
    isNormalUser = true;
    description = "t";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    git
    vim
    curl
  ];

  system.stateVersion = "26.05"; 
}
