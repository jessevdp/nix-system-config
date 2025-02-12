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

}
