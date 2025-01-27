{
  imports = [
    ./autosuggestion.nix
    ./completion.nix
    ./e.nix
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
