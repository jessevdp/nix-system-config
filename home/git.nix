{config, ...}: {
  age.secrets.jessevdp_github_auth = {
    file = "${config.home.homeDirectory}/.config/nix-system/secrets/ssh/jessevdp_github_auth_ed25519.age";
    path = "${config.home.homeDirectory}/.ssh/jessevdp_github_auth_ed25519";
  };

  programs.ssh.matchBlocks."github.com" = {
    identityFile = "~/.ssh/jessevdp_github_auth_ed25519";
  };

  age.secrets.jessevdp_github_signing = {
    file = "${config.home.homeDirectory}/.config/nix-system/secrets/ssh/jessevdp_github_signing_ed25519.age";
    path = "${config.home.homeDirectory}/.ssh/jessevdp_github_signing_ed25519";
  };

  programs.git = {
    enable = true;
    userName = "Jesse van der Pluijm";
    userEmail = "jessevdp@hey.com";

    extraConfig = {
      gpg.format = "ssh";
      user.signingkey = "~/.ssh/jessevdp_github_signing_ed25519";
      commit.gpgsign = true;
    };
  };
}
