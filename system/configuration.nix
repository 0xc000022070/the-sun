{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
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

  virtualisation.vmVariant = {
    virtualisation = {
      memorySize = 2048;
      graphics = false;
      diskSize = 4096;
      cores = 3;
    };
  };

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
