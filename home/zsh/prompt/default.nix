{
  pkgs,
  config,
  ...
}: let
  filename = "p10k/p10k.zsh";
in {
  xdg.configFile."${filename}".source = ./p10k.zsh;

  programs.zsh = {
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];

    initContentFirst =
      # sh
      ''
        # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
        # Initialization code that may require console input (password prompts, [y/n]
        # confirmations, etc.) must go above this block; everything else may go below.
        if [[ -r "${config.xdg.cacheHome}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
          source "${config.xdg.cacheHome}/p10k-instant-prompt-''${(%):-%n}.zsh"
        fi
      '';

    initContent =
      # sh
      ''
        [[ ! -f ${config.xdg.configHome}/${filename} ]] || source ${config.xdg.configHome}/${filename}
      '';
  };
}
