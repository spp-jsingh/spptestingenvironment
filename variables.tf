variable "aws_region" {
  default = "us-east-1"
}

# update with assigned CIDR block from Onboarding

variable "base_cidr_block" {
  description = "A /16 CIDR range definition, such as 10.10.0.0/16, that the VPC will use"
  default     = "10.240.4.0/23"
}

variable "public_subnet_blocks" {
  description = "public subnet cidrs used for subnets"
  type        = list(string)
  default     = ["10.240.4.0/25"]
}

variable "availability_zones" {
  description = "A list of availability zones in which to create subnets"
  type        = list(string)
  default     = ["us-east-1a"]
}

variable "private_subnet_blocks" {
  description = "private subnet cidrs used for subnets"
  type        = list(string)
  default     = ["10.240.5.0/25"]
}

variable "env_name" {
  description = "name used throughout this project"
  default     = "cst1000"
}

variable "ami" {
  description = "instance AMI ubuntu 20.04"
  default     = "ami-01b996646377b6619"
}
variable "spp-manage_cidr_block" {
  description = "spp-management network CIDR"
  default     = "0.0.0.0/0"
}

variable "app" {
  description = "variable for name of application"
  default     = "manage"
}

#variable "volume_size" {
#description = "additional EBS volume size in GB"
#default     = "100"
#}

variable "ec2type" {
  description = "instance type"
  default     = "t3.medium"
}

#variable "ec2_root_volume_type" {
#description = "volume type"
#default     = "gp2"
#}

#variable "ec2_root_volume_size" {
#description = "root volume size in GB"
#default     = "20"
#}

variable "deploy-public-key" {
  description = "default deployment ssh public key for ec2 instance"
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDa1CYSWjAFaVQXbcXFcg+/XslXoS6pjyjeAix70XWPatWrydW97YMkiCz/tfEE6aLiJ3om9vhs93X+WxmGrDI7YvyKugrgBpzxPGnfg4/Zbl5vvzx3fe1xZjkuGtm+7TUwBGB7k80WI7Fz291uRxCrlphY+U7kz/VlWL0F98X/O0MfDPXOnp0vc87k/l0fmHa5gfH++ciNdzQX7O0tUWbeoAnbbGoJ//V5s7HgvP2st37B4XSlcsNw8jlfYwDbytIyBAe6LuAuI1XqOFFvN6O4Pm+cu6GrBhknLSofFXDii25lGn/qhk79uIxEZIquBtqiKqbwwGgTc27VBlrciuQFkoFF5H1Exsb3EWKCfDAGeT0RPOZaydnJI7wSU/tRDAURXJa9/nDTPPHked53JO4HxaWmVT8rotm6Yh5b5AWf+knkp585nAXCJ1UNL4ws4z+4zKC/1OG+3g9aUTT6nrpkngPbCeJyskqS0KQcmC68rjozlAKm9VIgRF5Hn5u+hRU= jsingh@Justins-MacBook-Pro.local"
}

variable "private_key" {
  default = "~/.ssh/KeyPair.pem"
}

variable "ansible_user" {
  default = "ubuntu"
}
variable "instance_count" {
  default = "1"
}
