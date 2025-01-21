{
  programs.zsh.autosuggestion = {
    enable = true;
    strategy = ["history" "completion"];
  };

  programs.zsh.initExtra =
    # sh
    ''
      bindkey '^y' autosuggest-accept
      bindkey '\ey' forward-word  # ALT-y for partial accept
    '';
}
