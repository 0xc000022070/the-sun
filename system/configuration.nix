{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./vm-entrypoint.nix
    ./modules
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    kernelPackages = pkgs.linuxPackages_latest;
  };

  networking = {
    hostName = "the-sun";
    firewall.enable = true;
  };

  environment.systemPackages = [
    pkgs.home-manager
    pkgs.git
    pkgs.htop
  ];

  time.timeZone = "America/El_Salvador";

  system.stateVersion = "24.11";
}
