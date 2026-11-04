{
  config,
  pkgs,
  ...
}: {
  programs.awscli.enable = true;

  home.packages = [
    (pkgs.writeShellApplication {
      name = "aws-readonly-sql";
      runtimeInputs = [pkgs.awscli2];
      text = builtins.readFile ./aws-readonly-sql.sh;
    })
  ];

  age.secrets.knmi_aws_config = {
    file = "${config.home.homeDirectory}/.config/nix-system/secrets/aws/knmi_config.age";
    path = "${config.home.homeDirectory}/.aws/config";
  };
}
