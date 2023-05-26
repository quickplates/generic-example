{
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
    };
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [
        (
          if builtins.pathExists ./local.nix
          then ./local.nix
          else {}
        )
      ];

      systems = [
        "x86_64-linux"
        "i686-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem = {
        config,
        pkgs,
        system,
        ...
      }: {
        _module.args.pkgs = import inputs.nixpkgs {
          inherit system;
          config = {
            allowUnfree = true;
          };
        };

        formatter = pkgs.alejandra;

        devShells = {
          default = pkgs.mkShell {
            name = "dev";

            packages = [
              pkgs.trunk-io
              pkgs.nil
              pkgs.nodejs
            ];
          };

          docs = pkgs.mkShell {
            name = "docs";

            packages = [
              pkgs.nodejs
            ];
          };
        };
      };
    };
}
