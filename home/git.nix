{config, ...}: {
  age.secrets.jessevdp_github_auth_ssh_key = {
    file = "${config.home.homeDirectory}/.config/nix-system/secrets/ssh/jessevdp_github_auth_ed25519.age";
    path = "${config.home.homeDirectory}/.ssh/jessevdp_github_auth_ed25519";
  };

  programs.ssh.matchBlocks."github.com" = {
    identityFile = config.age.secrets.jessevdp_github_auth_ssh_key.path;
  };

  age.secrets.jessevdp_github_signing_ssh_key = {
    file = "${config.home.homeDirectory}/.config/nix-system/secrets/ssh/jessevdp_github_signing_ed25519.age";
    path = "${config.home.homeDirectory}/.ssh/jessevdp_github_signing_ed25519";
  };

  programs.git = {
    enable = true;
    userName = "Jesse van der Pluijm";
    userEmail = "jessevdp@hey.com";

    extraConfig = {
      gpg.format = "ssh";
      user.signingkey = config.age.secrets.jessevdp_github_signing_ssh_key.path;
      commit.gpgsign = true;

      pull.rebase = true;
      push.autoSetupRemote = true;
      init.defaultBranch = "main";
    };
  };
}
