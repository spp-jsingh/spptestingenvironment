
# this section will be added by a github workflow to keep the token safe
#
#provider "twingate" {
#  api_token = "1234567890abcdef"
#  network   = "autoco"
#}

data "aws_ami" "latest" {
  most_recent = true
  filter {
    name = "name"
    values = [
      "twingate/images/hvm-ssd/twingate-amd64-*",
    ]
  }
  owners = ["617935088040"]
}

resource "twingate_remote_network" "aws_network" {
  name = var.twingate-network
}

resource "twingate_connector" "aws_connector" {
  remote_network_id = twingate_remote_network.aws_network.id
}

resource "twingate_connector_tokens" "aws_connector_tokens" {
  connector_id = twingate_connector.aws_connector.id
}

module "twingate-connector" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.19.0"

  name                   = var.twingate-connector-name
  user_data              = <<-EOT
    #!/bin/bash
    set -e
    mkdir -p /etc/twingate/
    {
      echo TWINGATE_URL="https://${var.twingate-client-id}.twingate.com"
      echo TWINGATE_ACCESS_TOKEN="${twingate_connector_tokens.aws_connector_tokens.access_token}"
      echo TWINGATE_REFRESH_TOKEN="${twingate_connector_tokens.aws_connector_tokens.refresh_token}"
    } > /etc/twingate/connector.conf
    sudo systemctl enable --now twingate-connector
  EOT
  ami                    = data.aws_ami.latest.id
  instance_type          = "t3a.micro"
  vpc_security_group_ids = [module.twingate_security_group.security_group_id]
  subnet_id              = element(module.vpc.private_subnets, 0)
}
