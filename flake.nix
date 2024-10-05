{
  description = "Infrastructure for \"The Sun\" (home server) ";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = {nixpkgs, ...}: let
    system = "x86_64-linux";

    host = {
      name = "the-sun";
      timeZone = "America/El_Salvador";
    };

    nix.stateVersion = "24.11";

    nixosSystem = nixpkgs.lib.nixosSystem {
      inherit system;

      specialArgs = {
        inherit host nix;
      };

      modules = [
        ./system/configuration.nix
      ];
    };
  in {
    nixosConfigurations.${host.name} = nixosSystem;

    vms.${host.name} = nixosSystem.config.system.build.vm;
  };
}
