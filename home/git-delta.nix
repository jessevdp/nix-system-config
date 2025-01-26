{
  programs.git.delta = {
    enable = true;
    options = {
      navigate = true; # n and N keybindings to move

      features = "gruvmax-fang";

      "gruvmax-fang" = {
        # General appearance
        dark = true;
        syntax-theme = "gruvbox-dark";
        # File
        file-style = "bright-white bold";
        file-added-label = "[+]";
        file-copied-label = "[==]";
        file-modified-label = "[*]";
        file-removed-label = "[-]";
        file-renamed-label = "[->]";
        file-decoration-style = "#84786A ul";
        # No hunk headers
        hunk-header-style = "omit";
        # Line numbers
        line-numbers = "true";
        line-numbers-minus-style = "red";
        line-numbers-plus-style = "green";
        line-numbers-left-style = "bright-black";
        line-numbers-right-style = "bright-black";
        line-numbers-zero-style = "bright-black";
        line-numbers-left-format = " {nm:>3} │";
        line-numbers-right-format = " {np:>3} │";
        # Commit hash
        commit-decoration-style = "normal box";
        commit-style = "bright-white bold";
        # Diff contents
        inline-hint-style = "syntax";
        minus-style = "syntax #330011";
        minus-emph-style = "syntax #80002a";
        minus-non-emph-style = "syntax auto";
        plus-style = "syntax #001a00";
        plus-emph-style = "syntax #003300";
        plus-non-emph-style = "syntax auto";
        whitespace-error-style = "#FB4934 reverse";
        # Blame
        blame-code-style = "syntax";
        blame-format = "{author:>18} ({commit:>8}) {timestamp:<13} ";
        blame-palette = "#000000 #1d2021 #282828 #3c3836";
        # Merge conflicts
        merge-conflict-begin-symbol = "⌃";
        merge-conflict-end-symbol = "⌄";
        merge-conflict-ours-diff-header-style = "#FABD2F bold";
        merge-conflict-theirs-diff-header-style = "#FABD2F bold overline";
        merge-conflict-ours-diff-header-decoration-style = "";
        merge-conflict-theirs-diff-header-decoration-style = "";
      };
    };
  };
}
