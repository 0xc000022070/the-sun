{pkgs, ...}: {
  environment = {
    systemPackages = [
      pkgs.eza
    ];

    shellAliases = {
      ls = "exa --icons";
    };
  };
}
