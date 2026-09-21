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
        name = "sst/tap/opencode";
        trusted = true;
      }
    ];
  };
  environment.systemPath = [
    "${config.homebrew.prefix}/bin"
  ];
}
