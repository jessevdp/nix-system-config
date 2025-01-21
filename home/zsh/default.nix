{
  imports = [
    ./autosuggestion.nix
    ./completion.nix
    ./fzf.nix
    ./history.nix
    ./prompt
    ./vi-mode
    ./zoxide.nix
  ];

  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
  };
}
