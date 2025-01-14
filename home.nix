{config, ...}: {
  home = {
    # Used for backwards compatibility, please read the release notes / changelog
    # before changing.
    stateVersion = "25.05";
  };

  xdg = {
    enable = true;
  };

  xdg.configFile = {
    "ghostty/config".text = ''
      theme = GruvboxDark

      title = " "
      macos-titlebar-proxy-icon = hidden

      font-family = JetBrainsMono Nerd Font Mono
      font-size = 16
      window-inherit-font-size = true

      window-width = 128
      window-height = 40

      macos-option-as-alt = true

      macos-icon = custom-style
      macos-icon-ghost-color = #fbf1c7
      macos-icon-screen-color = #282828
      macos-icon-frame = aluminum
    '';
  };

  age.identityPaths = [
    "${config.home.homeDirectory}/.ssh/nix_system_secrets_decryption_ed25519"
  ];

  age.secrets.jessevdp_github_auth = {
    file = "${config.home.homeDirectory}/.config/nix-system/secrets/ssh/jessevdp_github_auth_ed25519.age";
    path = "${config.home.homeDirectory}/.ssh/jessevdp_github_auth_ed25519";
  };

  programs.ssh = {
    enable = true;
    matchBlocks = {
      "github.com" = {
        identityFile = "~/.ssh/jessevdp_github_auth_ed25519";
      };
    };
    extraConfig = ''
      UseKeychain yes
      AddKeysToAgent yes
    '';
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
