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
      "spotify"
      "tableplus"
      "typora"
      "utm" # vm
      "cursor-cli"
    ];
    brews = [
    ];
  };
  environment.systemPath = [
    config.homebrew.brewPrefix
  ];
}
