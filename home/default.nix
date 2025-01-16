{config, ...}: {
  imports = [
    ./ghostty.nix
    ./git.nix
  ];

  home = {
    # Used for backwards compatibility, please read the release notes / changelog
    # before changing.
    stateVersion = "25.05";
  };

  xdg = {
    enable = true;
  };

  age.identityPaths = [
    "${config.home.homeDirectory}/.ssh/nix_system_secrets_decryption_ed25519"
  ];

  programs.zsh.enable = true;

  programs.ssh = {
    enable = true;
    extraConfig = ''
      UseKeychain yes
      AddKeysToAgent yes
    '';
  };
}
