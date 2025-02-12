{pkgs, config, ...}: {
  home = {
    packages = with pkgs; [
      docker
      colima
    ];
  };
}
