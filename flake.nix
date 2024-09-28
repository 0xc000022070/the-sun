{
  description = "Reproducible infrastructure and usize for \"The Sun\"";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = {nixpkgs, ...}: let
    system = "x86_64-linux";

    nixosSystem = nixpkgs.lib.nixosSystem {
      inherit system;

      modules = [
        ./system/configuration.nix
      ];
    };
  in {
    nixosConfigurations."the-sun" = nixosSystem;

    vms."the-sun" = nixosSystem.config.system.build.vm;
  };
}
