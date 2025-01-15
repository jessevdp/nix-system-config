{
  homebrew = {
    enable = true;
    onActivation = {
      cleanup = "zap";
    };
    casks = [
      "ghostty"
    ];
  };
}
