{config, ...}: let
  sshHostAlias = "gitlab-jessevdp-io";
in {
  age.secrets.jessevdp_io_gitlab_auth_ssh_key = {
    file = "${config.home.homeDirectory}/.config/nix-system/secrets/ssh/jessevdp_io_gitlab_auth_ed25519.age";
    path = "${config.home.homeDirectory}/.ssh/jessevdp_io_gitlab_auth_ed25519";
  };

  programs.ssh.matchBlocks."${sshHostAlias}" = {
    hostname = "gitlab.com";
    identityFile = config.age.secrets.jessevdp_io_gitlab_auth_ssh_key.path;
  };

  programs.git.includes = [
    {
      condition = "hasconfig:remote.*.url:git@${sshHostAlias}:*/**";
      contents = {
        commit.gpgsign = false;
        user.email = "jesse.vanderpluijm@iodigital.com";
      };
    }
  ];

  programs.lazygit.settings.services."${sshHostAlias}" = "gitlab:gitlab.com";
}
