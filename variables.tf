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
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPYfrasy/6vbTsleadFk9dwNyn3dCItnNjdA2sYaDA2B spp-deploy"
}

variable "network" {
  default = "autoco"
}