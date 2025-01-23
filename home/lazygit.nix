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
    };
  };

  programs.zsh.shellAliases = {
    lg = "lazygit";
  };
}
