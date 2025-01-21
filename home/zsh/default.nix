{
  imports = [
    ./fzf.nix
    ./prompt
    ./vi-mode
  ];

  programs.zsh = {
    enable = true;
  };
}
