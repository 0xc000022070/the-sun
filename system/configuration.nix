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
    users.sized = {
      isNormalUser = true;
      extraGroups = ["wheel"];
      # Try to use age to encrypt this kind of stuff
      hashedPassword = "$y$j9T$cSurqrcVHajqa.bHgm6R11$sBBanNL/NFUh0wWJXBJxHXP6IM1/ye2sJ3xwFRVxK0C";
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
