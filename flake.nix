{
  description = "Reproducible infrastructure and usize for \"The Sun\"";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = {nixpkgs, ...}: let
    system = "x86_64-linux";
  in {
    nixosConfigurations.the-sun = nixpkgs.lib.nixosSystem {
      inherit system;

      modules = [
        ./system/configuration.nix
      ];
    };
  };
}
