{
  imports = [
    ./autosuggestion.nix
    ./completion.nix
    ./fzf.nix
    ./history.nix
    ./prompt
    ./vi-mode
  ];

  programs.zsh = {
    enable = true;
  };
}
