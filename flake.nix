{
  description = "System flake by jessevdp";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };

    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mac-app-util = {
      url = "github:hraban/mac-app-util";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-utils.follows = "flake-utils";
        systems.follows = "systems";
      };
    };

    home-manager = {
      url = "github:nix-community/home-manager";
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
    mac-app-util,
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
              config = {
                allowUnfree = true;
              };
            };
          }
          ./darwin
          mac-app-util.darwinModules.default
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.users.jessevanderpluijm = {...}: {
              imports = [
                ./home
                mac-app-util.homeManagerModules.default
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
