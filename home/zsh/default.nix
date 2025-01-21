{
  imports = [
    ./completion.nix
    ./fzf.nix
    ./prompt
    ./vi-mode
  ];

  programs.zsh = {
    enable = true;
  };
}
