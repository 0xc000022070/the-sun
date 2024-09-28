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

  networking.hostName = "the-sun";

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = true;
  };

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [22];
  };

  environment.systemPackages = with pkgs; [
    htop
  ];

  time.timeZone = "America/El_Salvador";

  system.stateVersion = "24.11";
}
