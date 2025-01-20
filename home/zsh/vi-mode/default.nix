{
  programs.zsh = {
    defaultKeymap = "viins";

    sessionVariables = {
      KEYTIMEOUT = 1; # Reduce mode switching delay
    };

    initExtra =
      # sh
      ''
        bindkey -v
        bindkey -M vicmd '^r' redo # rebind becuase ^r is overriden by fzf for history search
        bindkey '^p' history-search-backward
        bindkey '^n' history-search-forward

        source ${./cursor.zsh}
        source ${./edit-command-line.zsh}
        source ${./surround.zsh}
        source ${./text-objects.zsh}

        # highlight for visually selected region
        zle_highlight=(region:bg=8)
      '';
  };
}
