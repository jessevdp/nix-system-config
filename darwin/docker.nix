{
  services.colima = {
    enable = true;
    enableDockerCompatability = true;
    groupMembers = [
      # TODO: make username a variable?
      "jessevanderpluijm"
    ];
  };
}
