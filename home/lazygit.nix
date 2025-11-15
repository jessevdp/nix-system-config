{
  programs.lazygit = {
    enable = true;
    settings = {
      gui = {
        border = "single";
        nerdFontsVersion = "3";
        filterMode = "fuzzy";
        statusPanelView = "allBranchesLog";
      };
      git = {
        paging = {
          colorArg = "always";
          pager = "delta --dark --paging=never";
        };
        # Since I'm using a passphrase agent (gpg-agent) and I don't need to
        # enter my passphrase when signing, GPG signing isn't blocking and we
        # don't need to spawn a separate process when using GPG.
        overrideGpg = true;
      };
    };
  };

  programs.zsh.shellAliases = {
    lg = "lazygit";
  };
}
