{pkgs, ...}: {
  home.packages = with pkgs; [
    lazydocker
  ];

  xdg.configFile."lazydocker/config.yml".text =
    # yaml
    ''
    gui:
      border: "single"
    '';
}
