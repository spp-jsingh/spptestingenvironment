resource "aws_key_pair" "deploy" {
  key_name   = "Key-Pair"
  public_key = var.deploy-public-key


  tags = {
    Terraform   = "true"
    Environment = "spp-deploy"
  }
}