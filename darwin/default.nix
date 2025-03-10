{pkgs, ...}: {
  imports = [
    ./1password.nix
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

  # We install Nix using a separate installer so we don't want nix-darwin
  # to manage it for us. This tells nix-darwin to just use whatever is running.
  nix.useDaemon = true;

  programs.zsh.enable = true;

  # TODO: make username a variable?
  users.users."jessevanderpluijm" = {
    home = "/Users/jessevanderpluijm";
  };

  environment.systemPackages = with pkgs; [
    git
    vim
  ];

  security.pam.enableSudoTouchIdAuth = true;
}
