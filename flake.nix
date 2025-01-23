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

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.darwin.follows = "darwin";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = {
    self,
    darwin,
    home-manager,
    agenix,
    ...
  }: {
    darwinConfigurations."LJQPCW4D95" = darwin.lib.darwinSystem {
      modules = [
        {
          # Set Git commit hash for darwin-version.
          system.configurationRevision = self.rev or self.dirtyRev or null;

          nix.settings.experimental-features = [
            "nix-command"
            "flakes"
          ];

          nixpkgs.hostPlatform = "aarch64-darwin";
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
  };
}
