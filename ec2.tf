module "jumpbox" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"
  name    = "${var.env_name}.${var.app}.jumpbox"

  ami                         = var.ami
  instance_type               = var.ec2type
  key_name                    = aws_key_pair.deploy.id
  vpc_security_group_ids      = ["${module.jumpbox_security_group.security_group_id}"]
  subnet_id                   = element(module.vpc.public_subnets, 0)
  associate_public_ip_address = true

  tags = {
    app         = var.app
    Terraform   = "true"
    Environment = var.env_name
  }
}
resource "aws_network_interface" "jumpbox-private" {
  subnet_id       = element(module.vpc.private_subnets, 0)
  security_groups = ["${module.jumpbox_security_group.security_group_id}"]

  attachment {
    instance     = module.jumpbox.id
    device_index = 1
  }
}

module "ansible" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"
  name    = "${var.env_name}.${var.app}.ansible"

  ami                         = var.ami
  instance_type               = var.ec2type
  key_name                    = aws_key_pair.deploy.id
  vpc_security_group_ids      = ["${module.ansible_security_group.security_group_id}"]
  subnet_id                   = element(module.vpc.private_subnets, 0)
  associate_public_ip_address = false

  tags = {
    app         = var.app
    Terraform   = "true"
    Environment = var.env_name
  }
}