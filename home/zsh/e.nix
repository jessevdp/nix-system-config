{
  programs.zsh = {
    history.ignorePatterns = [
      "e"
    ];
    initExtra =
      # sh
      ''
        function e() {
          ''${EDITOR:-vim} "$@"
        }
      '';
  };
}
