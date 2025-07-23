{
  programs.zsh = {
    history.ignorePatterns = [
      "e"
    ];
    initContent =
      # sh
      ''
        function e() {
          ''${EDITOR:-vim} "$@"
        }
      '';
  };
}
