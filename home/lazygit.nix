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
      };
    };
  };

  programs.zsh.shellAliases = {
    lg = "lazygit";
  };
}
