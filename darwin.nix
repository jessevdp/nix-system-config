{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    git
    vim
  ];

  homebrew = {
    enable = true;
    onActivation = {
      cleanup = "zap";
    };
    casks = [
      "ghostty"
    ];
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToControl = true;
    swapLeftCtrlAndFn = true;
  };

  system.defaults.dock = {
    autohide = true;
    persistent-apps = [
      "/System/Cryptexes/App/System/Applications/Safari.app" # "/Applications/Safari.app"
      "/Applications/Ghostty.app"
    ];
    persistent-others = [
      "${config.users.users."jessevanderpluijm".home}/Downloads"
    ];
    show-recents = false;
  };

  system.defaults.dock.mru-spaces = false;

  system.defaults.finder = {
    AppleShowAllExtensions = true;
    AppleShowAllFiles = true;
    FXEnableExtensionChangeWarning = false;
    FXPreferredViewStyle = "clmv";
    _FXSortFoldersFirst = true;
    _FXSortFoldersFirstOnDesktop = true;
  };
}
