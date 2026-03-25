{pkgs, ...}: {
  programs.less.enable = true;
  home = {
    packages = with pkgs; [
      coreutils
      rsync
      tree
    ];
    sessionVariables = {
      CLICOLOR = 1;
    };
    shellAliases = {
      ls = "ls --color=always --classify";
      ll = "ls -l --almost-all --human-readable";
    };
  };

  home.file.".hushlogin".text = "";

  # home.file.".inputrc".text =
  #   # bash
  #   ''
  #     "\C-p":history-search-backward
  #     "\C-n":history-search-forward
  #
  #     set colored-stats on
  #     set visible-stats on
  #     set mark-directories on
  #     set mark-symlinked-directories on
  #
  #     set completion-ignore-case on
  #
  #     set show-all-if-ambiguous on
  #     set show-all-if-unmodified on
  #
  #     set keymap vi
  #     set editing-mode vi-insert
  #
  #     set vi-ins-mode-string \1\e[5 q\2 # blinking bar
  #     set vi-cmd-mode-string \1\e[2 q\2 # solid block
  #   '';
}
