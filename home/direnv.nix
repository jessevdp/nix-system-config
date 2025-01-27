{
  programs.direnv = {
    enable = true;
    config = {
      global = {
        hide_env_diff = true; # hide verbose env diff when entering a dir
        warn_timeout = "30s";
      };
    };
  };
  programs.git.ignores = [".direnv"];
}
