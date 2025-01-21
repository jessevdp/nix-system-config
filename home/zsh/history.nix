{config, ...}: {
  programs.zsh.history = {
    save = 10000;
    size = 10000;
    path = "${config.xdg.dataHome}/zsh/history";

    append = true;
    share = true;
    extended = true;
    ignoreAllDups = true;
    ignoreSpace = true;

    ignorePatterns = [
      "ls"
      "cd"
      "cd .."
      "cd -"
      "pwd"
      "exit"
      "date"
      "* --help"
      "clear"
      "history"
      "bg"
      "fg"
      "jobs"
      "whoami"
    ];
  };
}
