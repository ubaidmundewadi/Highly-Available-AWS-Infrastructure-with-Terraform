module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name            = var.VPC_NAME
  cidr            = var.VpcCIDR
  azs             = [var.Zone1, var.Zone2, var.Zone3]
  private_subnets = [var.PubSub1CIDR, var.PubSub2CIDR, var.PubSub3CIDR]
  public_subnets  = [var.Priv1SubCIDR, var.Priv2SubCIDR, var.Priv3SubCIDR]

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true
  enable_dns_support   = true
  map_public_ip_on_launch = true    # This will assign public ip to instances created in public subnet

  tags = {
    Terraform   = "true"
    Environment = "Prod"
  }

  vpc_tags = {
    Name = var.VPC_NAME
  }

}
