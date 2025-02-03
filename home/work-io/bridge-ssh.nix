{config, ...}: {
  age.secrets.id_io_bridge_ssh_key = {
    file = "${config.home.homeDirectory}/.config/nix-system/secrets/ssh/id_io_bridge_ed25519.age";
    path = "${config.home.homeDirectory}/.ssh/id_io_bridge_ed25519";
  };

  programs.ssh.extraConfig = ''
    IdentityFile ${config.age.secrets.id_io_bridge_ssh_key.path}
  '';
}
