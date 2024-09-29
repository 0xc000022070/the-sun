{
  nix.settings = rec {
    auto-optimise-store = true;
    keep-outputs = true;
    warn-dirty = false;
    download-attempts = 3;
    experimental-features = ["nix-command" "flakes"];
    # Required by cachix
    trusted-users = ["root" "luisnquin"];
    allowed-users = trusted-users;
  };

  environment.variables = {
    NIXPKGS_ALLOW_UNFREE = "1";
  };
}
