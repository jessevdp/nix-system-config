{
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh.sessionVariables = {
    _ZO_FZF_OPTS = "$FZF_DEFAULT_OPTS";
  };
}
