output "security-group" {
  value = module.jumpbox_security_group
}

output "vpc-splunk" {
  value = module.vpc
}

output "ec2-instance" {
  value = module.jumpbox
}

output "private_ip" {
  value = module.ansible
}

output "public_ip" {
  value = module.jumpbox
}