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
  }: let
    darwin-configuration = {
      config,
      pkgs,
      ...
    }: {
      environment.systemPackages = with pkgs; [
        git
        vim
      ];

      homebrew = {
        enable = true;
        onActivation = {
          cleanup = "zap";
        };
        casks = [
          "ghostty"
        ];
      };

      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

      system.keyboard = {
        enableKeyMapping = true;
        remapCapsLockToControl = true;
        swapLeftCtrlAndFn = true;
      };

      system.defaults.dock = {
        autohide = true;
        persistent-apps = [
          "/System/Cryptexes/App/System/Applications/Safari.app" # "/Applications/Safari.app"
          "/Applications/Ghostty.app"
        ];
        persistent-others = [
          "${config.users.users."jessevanderpluijm".home}/Downloads"
        ];
        show-recents = false;
      };

      system.defaults.dock.mru-spaces = false;

      system.defaults.finder = {
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        FXPreferredViewStyle = "clmv";
        _FXSortFoldersFirst = true;
        _FXSortFoldersFirstOnDesktop = true;
      };

      users.users."jessevanderpluijm" = {
        home = "/Users/jessevanderpluijm";
      };

      # We install Nix using a separate installer so we don't want nix-darwin
      # to manage it for us. This tells nix-darwin to just use whatever is running.
      nix.useDaemon = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in {
    darwinConfigurations."LJQPCW4D95" = darwin.lib.darwinSystem {
      modules = [
        darwin-configuration
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.jessevanderpluijm = {...}: {
            imports = [
              ./home.nix
              agenix.homeManagerModules.default
            ];
          };
        }
      ];
    };
  };
}
