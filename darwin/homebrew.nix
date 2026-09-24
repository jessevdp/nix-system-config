{config, ...}: {
  homebrew = {
    enable = true;
    onActivation = {
      upgrade = true;
      autoUpdate = true;
      cleanup = "zap";
    };
    casks = [
      "ghostty"
      "lm-studio"
      "logi-options+"
      "omniwm"
      "spotify"
      "tableplus"
      "typora"
      "utm" # vm
      "cursor-cli"
    ];
    brews = [
      {
        name = "anomalyco/tap/opencode-v2";
        trusted = true;
      }
    ];
  };
  environment.systemPath = [
    "${config.homebrew.prefix}/bin"
  ];
}
