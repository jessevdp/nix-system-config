{
  homebrew.casks = ["maccy"];
  system.defaults.CustomUserPreferences = {
    # find defaults using:
    #
    #   $ defaults find org.p0deje.Maccy
    #
    "org.p0deje.Maccy" = {
      showTitle = 0;
      showFooter = 0;
      showApplicationIcons = 1;

      menuIcon = "paperclip";
      showRecentCopyInMenuBar = 0;

      popupPosition = "statusItem";

      pasteByDefault = 1;

      showSearch = 1;
      searchMode = "fuzzy";
      highlightMatch = "color";

      historySize = 1000;

      # Command (⌘) + Shift (⇧) + C
      KeyboardShortcuts_popup = "{\"carbonKeyCode\":8,\"carbonModifiers\":768}";
      # Command (⌘) + P
      KeyboardShortcuts_pin = "{\"carbonKeyCode\":35,\"carbonModifiers\": 256 }";
      # Command (⌘) + Backspace (⌫)
      KeyboardShortcuts_delete = "{\"carbonKeyCode\":51,\"carbonModifiers\": 256 }";
    };
  };
}
