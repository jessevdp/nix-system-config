{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    zsh-completions
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;

    initContentBeforeCompInit =
      # sh
      ''
        fpath+=${pkgs.zsh-completions}/share/zsh/site-functions
      '';

    initContent =
      # sh
      ''
        zstyle ':completion:*' use-cache on
        zstyle ':completion:*' cache-path "${config.xdg.cacheHome}/zsh/zcompcache"
      '';
  };
}
