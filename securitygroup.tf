module "jumpbox_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4"

  name        = "jumpbox-security-group"
  description = "security group for EC2"
  vpc_id      = module.vpc.vpc_id

  # ingress
  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "ssh"
      cidr_blocks = var.spp-manage_cidr_block
    },
  ]
  # egress
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      description = "Allow outbound"
      cidr_blocks = "0.0.0.0/0"
    },
  ]

  tags = {
    app         = var.app
    Terraform   = "true"
    Environment = var.env_name
  }
}


module "ansible_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4"

  name        = "ansible-security-group"
  description = "security group for EC2"
  vpc_id      = module.vpc.vpc_id

  # ingress
  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "ssh"
      cidr_blocks = var.spp-manage_cidr_block
    },
  ]
  # egress
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      description = "Allow outbound"
      cidr_blocks = "0.0.0.0/0"
    },
  ]

  tags = {
    app         = var.app
    Terraform   = "true"
    Environment = var.env_name
  }
}