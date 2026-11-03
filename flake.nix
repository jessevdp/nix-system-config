{
  description = "System flake by jessevdp";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-26.05";
    };

    darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        darwin.follows = "darwin";
        home-manager.follows = "home-manager";
        systems.follows = "systems";
      };
    };

    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.systems.follows = "systems";
    };

    systems.url = "github:nix-systems/default";
  };

  outputs = {
    self,
    nixpkgs,
    darwin,
    home-manager,
    agenix,
    flake-utils,
    ...
  }:
    {
      darwinConfigurations."LJQPCW4D95" = darwin.lib.darwinSystem {
        modules = [
          {
            # Set Git commit hash for darwin-version.
            system.configurationRevision = self.rev or self.dirtyRev or null;

            nix.settings.experimental-features = [
              "nix-command"
              "flakes"
            ];

            nixpkgs = {
              hostPlatform = "aarch64-darwin";
              overlays = [
                (final: prev: {
                  direnv = prev.direnv.overrideAttrs (old: {
                    buildPhase = ''
                      CGO_ENABLED=1 make BASH_PATH=$BASH_PATH
                    '';
                  });
                })
              ];
              config = {
                allowUnfree = true;
                permittedInsecurePackages = [
                  "lima-full-1.2.2"
                  "lima-additional-guestagents-1.2.2"
                ];
              };
            };
          }
          ./darwin
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.users.jessevanderpluijm = {...}: {
              imports = [
                ./home
                agenix.homeManagerModules.default
              ];
            };
          }
        ];
      };

      editorHomeManagerConfiguration = home-manager.lib.homeManagerConfiguration {
        pkgs = self.darwinConfigurations."LJQPCW4D95".pkgs;
        modules = [
          ./home
          agenix.homeManagerModules.default
        ];
      };
    }
    // (
      flake-utils.lib.eachDefaultSystem (
        system: let
          pkgs = import nixpkgs {
            inherit system;
          };
        in {
          devShells.default = pkgs.mkShell {
            buildInputs = with pkgs; [
              nixd
              alejandra
              statix
              deadnix
            ];
          };
        }
      )
    );
}
