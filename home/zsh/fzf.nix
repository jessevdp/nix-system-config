{pkgs, ...}: {
  home.packages = with pkgs; [
    fd
  ];

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;

    # For CTRL-T and direct fzf command (files only)
    defaultCommand = "fd --type f --strip-cwd-prefix --hidden --follow --exclude .git";

    # For ALT-C (directories only)
    changeDirWidgetCommand = "fd --type d --strip-cwd-prefix --hidden --follow --exclude .git";

    defaultOptions = [
      "--layout=reverse"
      "--height=~40%"
      "--border sharp"
      "--info inline-right"
    ];

    colors = {
      "fg" = "white";
      "fg+" = "#ebdbb2"; # NOTE: non-standard
      "preview-fg" = "white";
      "bg" = "black";
      "bg+" = "#3c3836"; # NOTE: non-standard
      "preview-bg" = "black";
      "hl" = "blue";
      "hl+" = "blue";
      "info" = "yellow";
      "border" = "#3c3836"; # NOTE: non-standard
      "prompt" = "yellow";
      "pointer" = "red";
      "marker" = "red";
      "spinner" = "red";
      "header" = "blue";
    };
  };

  programs.zsh = {
    plugins = [
      {
        name = "fzf-tab";
        src = pkgs.zsh-fzf-tab;
        file = "share/fzf-tab/fzf-tab.plugin.zsh";
      }
    ];

    initContent =
      # sh
      ''
        bindkey -M vicmd / fzf-history-widget
      '';
  };
}
