{pkgs, ...}: {
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "gruvbox-dark";
      vim_keys = true;
      rounded_corners = false;
    };
  };

  xdg.configFile."btop/themes/gruvbox-dark.theme".source = "${pkgs.btop}/share/btop/themes/gruvbox_dark_v2.theme";
}
