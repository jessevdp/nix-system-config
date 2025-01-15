{config, ...}: {
  system.defaults.dock = {
    autohide = true;
    persistent-apps = [
      "/System/Cryptexes/App/System/Applications/Safari.app" # "/Applications/Safari.app"
      "/Applications/Ghostty.app"
    ];
    persistent-others = [
      # TODO: make username a variable?
      "${config.users.users."jessevanderpluijm".home}/Downloads"
    ];
    show-recents = false;
  };
}
