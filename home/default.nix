{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./bat.nix
    ./btop.nix
    ./core.nix
    ./direnv.nix
    ./docker.nix
    ./ghostty.nix
    ./git-delta.nix
    ./git.nix
    ./lazydocker.nix
    ./lazygit.nix
    ./safari.nix
    ./ssh.nix
    ./zellij
    ./zsh

    ./work-io
  ];

  home = {
    # Used for backwards compatibility, please read the release notes / changelog
    # before changing.
    stateVersion = "25.05";

    # TODO: make variable & inherit from Darwin config?
    homeDirectory = lib.mkDefault "/Users/jessevanderpluijm/";
    username = lib.mkDefault "jessevanderpluijm";
  };

  xdg = {
    enable = true;
  };

  age.identityPaths = [
    "${config.home.homeDirectory}/.ssh/nix_system_secrets_decryption_ed25519"
  ];

  services.ollama = {
    enable = true;
  };

  programs.nh.enable = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withRuby = false;
  };
  home.sessionVariables = {
    MANPAGER = "nvim +Man!";
  };

  home.packages = with pkgs; [
    ripgrep
    harper
    nodePackages.cspell

    obsidian
  ];
}
