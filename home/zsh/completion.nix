{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    zsh-completions
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;

    initContent = let
      beforeCompInit =
        lib.mkOrder 550
        # sh
        ''
          fpath+=${pkgs.zsh-completions}/share/zsh/site-functions
        '';
      zshConfig =
        lib.mkOrder 1000
        # sh
        ''
          zstyle ':completion:*' use-cache on
          zstyle ':completion:*' cache-path "${config.xdg.cacheHome}/zsh/zcompcache"
        '';
    in
      lib.mkMerge [beforeCompInit zshConfig];
  };
}
