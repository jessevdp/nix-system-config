{pkgs, ...}: {
  imports = [
    ./1password.nix
    ./discord.nix
    ./dock.nix
    ./finder.nix
    ./homebrew.nix
    ./keyboard.nix
    ./maccy.nix
    ./mc.nix
    ./mission-control.nix
  ];

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;

  programs.zsh.enable = true;

  # TODO: make username a variable?
  users.users."jessevanderpluijm" = {
    home = "/Users/jessevanderpluijm";
  };

  system.primaryUser = "jessevanderpluijm";

  environment.systemPackages = with pkgs; [
    git
    vim
  ];

  security.pam.services.sudo_local.touchIdAuth = true;
}
