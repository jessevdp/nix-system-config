{
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    docker
  ];

  services.colima = {
    enable = true;
    createDockerSocket = true;
    groupMembers = [
      "jessevanderpluijm"
    ];
  };
}
