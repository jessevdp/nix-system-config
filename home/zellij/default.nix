{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    zellij
  ];

  xdg.configFile = {
    "zellij/config.kdl".source = ./config.kdl;
    "zellij/layouts".source = ./layouts;
  };

  programs.zsh.initContent = lib.mkOrder 200
    # sh
    ''
      # FIXME: the regular zellij zsh completion integration is broken. See:
      # https://github.com/zellij-org/zellij/issues/1933
      # So instead of:
      #   eval "$(${lib.getExe pkgs.zellij} setup --generate-completion zsh)"
      # We use: (from: https://github.com/zellij-org/zellij/issues/1933#issuecomment-2274464004)
      . <( ${lib.getExe pkgs.zellij} setup --generate-completion zsh | sed -Ee 's/^(_(zellij) ).*/compdef \1\2/' )
    '';
}
