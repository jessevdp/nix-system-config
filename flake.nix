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
  };

  outputs = {
    self,
    darwin,
    ...
  }: let
    configuration = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        git
        vim
      ];

      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in {
    darwinConfigurations."simple" = darwin.lib.darwinSystem {
      modules = [configuration];
    };
  };
}
