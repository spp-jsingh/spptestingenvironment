module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 3.11.0"

  name = var.env_name
  cidr = var.base_cidr_block

  azs                  = var.availability_zones
  public_subnets       = var.public_subnet_blocks
  private_subnets      = var.private_subnet_blocks
  enable_dns_hostnames = true
  enable_dns_support   = true
  enable_nat_gateway   = true

  tags = {
    app         = var.app
    Terraform   = "true"
    Environment = var.env_name
  }
}