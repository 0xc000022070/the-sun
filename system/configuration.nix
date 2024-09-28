{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    kernelPackages = pkgs.linuxPackages_latest;
  };

  users = {
    groups.admin = {};
    users.luisnquin = {
      isNormalUser = true;
      extraGroups = ["wheel"];
      # Try to use age
      hashedPassword = "$y$j9T$SNio8sW7C2NoGBbErRqEq0$YNs/TCv4qkcKwHqDoSr/O1qra.GLyjnElc/dgtIT0P9";
      group = "admin";
    };
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
