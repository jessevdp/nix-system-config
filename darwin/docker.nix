{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    docker
    colima
  ];
}
