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

    initExtraBeforeCompInit =
      # sh
      ''
        fpath+=${pkgs.zsh-completions}/share/zsh/site-functions
      '';

    initExtra =
      # sh
      ''
        zstyle ':completion:*' use-cache on
        zstyle ':completion:*' cache-path "${config.xdg.cacheHome}/zsh/zcompcache"
      '';
  };
}
