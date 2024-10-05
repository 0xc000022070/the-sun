{
  host,
  pkgs,
  nix,
  ...
}: {
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

  system.activationScripts = {
    banner.text = ''
        echo '
                               ⢴⡀
                          ⢀⠀⠀⠀⠀⡇⢑⠀⠀⢀⡐⢱
                          ⠈⢏⠢⣀⣘⠀⣀⣣⣔⣁⣀⡯⠀⣀⣀⣀
                          ⠀⠈⡂⠔⠿⠉⠀⠈⠀⠀⠀⠉⠓⢄⡰⠋
                         ⢏⠈⠒⠷⣁⣀⡀⠀⠀⠀⣀⣀⠀⠀⠈⡗⠦⢄
                          ⠳⢄⢘⢻⣴⣿⠥⢼⣽⣷⣿⠤⠖⠒⡇⠀⣀⣈⡇
       ┓                ⠘⢗⠒⠛⢒⠙⠛⠁⠀⠀⠙⠛⠁⠀⠀⡸⠙⡍⠁
      ╋┣┓┏┓  ┏┓┏┏┓        ⠁⠒⠄⢵⣀⠀⠀⠀⠀⠀⠀⡠⣾⣁⡀⠘⣄
      ┗┛┗┗   ┛┗┻┛┗          ⣀⠴⠋⣑⣶⠒⢲⢮⠁⢰⠀⠀⠉⠓⠋
                           ⣎⡡⠆⠋⠀⣏⣀⠎⠀⠘⣄⢀⡇
                                ⠀⠁⠀⠀⠀⠀⠉
        '
    '';
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

  time = {
    inherit (host) timeZone;
  };

  system = {
    inherit (nix) stateVersion;
  };
}
