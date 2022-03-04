output "jump-security-group" {
  value = module.jumpbox_security_group
}

output "ansible-security-group" {
  value = module.ansible_security_group
}

output "jumpbox_public_ip" {
  value = module.jumpbox.public_ip
}

output "ansible_private_ip" {
  value = module.ansible.private_ip
}

output "nat_public_ips" {
  value = module.vpc.nat_public_ips
}
