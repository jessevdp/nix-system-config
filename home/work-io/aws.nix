{
  config,
  pkgs,
  ...
}: let
  aws-readonly-sql = pkgs.writeShellApplication {
    name = "aws-readonly-sql";
    runtimeInputs = [pkgs.awscli2];
    text = ''
      usage() {
        echo "usage: aws-readonly-sql --profile PROFILE --cluster CLUSTER --secret SECRET --database DATABASE SQL" >&2
        exit 64
      }

      profile="" cluster="" secret="" database="" sql=""
      while [ $# -gt 0 ]; do
        case "$1" in
          --profile) profile="$2"; shift 2 ;;
          --cluster) cluster="$2"; shift 2 ;;
          --secret) secret="$2"; shift 2 ;;
          --database) database="$2"; shift 2 ;;
          -*) usage ;;
          *) [ -z "$sql" ] || usage; sql="$1"; shift ;;
        esac
      done
      [ -n "$profile" ] && [ -n "$cluster" ] && [ -n "$secret" ] && [ -n "$database" ] && [ -n "$sql" ] || usage

      cluster_arn=$(aws rds describe-db-clusters --profile "$profile" --db-cluster-identifier "$cluster" --query 'DBClusters[0].DBClusterArn' --output text)
      secret_arn=$(aws secretsmanager describe-secret --profile "$profile" --secret-id "$secret" --query ARN --output text)

      data_api() {
        aws rds-data "$@" --profile "$profile" --resource-arn "$cluster_arn" --secret-arn "$secret_arn"
      }

      transaction=$(data_api begin-transaction --database "$database" --query transactionId --output text)
      trap 'data_api rollback-transaction --transaction-id "$transaction" > /dev/null' EXIT

      statement() {
        data_api execute-statement --database "$database" --transaction-id "$transaction" "$@"
      }

      statement --sql "set transaction read only" > /dev/null
      # Postgres only locks the read-only mode once the transaction has run a query.
      statement --sql "select 1" > /dev/null
      statement --sql "$sql" --format-records-as JSON --query formattedRecords --output text
    '';
  };
in {
  programs.awscli.enable = true;

  home.packages = [aws-readonly-sql];

  age.secrets.knmi_aws_config = {
    file = "${config.home.homeDirectory}/.config/nix-system/secrets/aws/knmi_config.age";
    path = "${config.home.homeDirectory}/.aws/config";
  };
}
