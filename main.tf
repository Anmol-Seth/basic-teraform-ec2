terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDTgNop0RyjDMSD+qeRrolbS7yS5kY2dd02CLmodyRIeISLL+DPjsbNW+fc0/0SSpFeqLco0CyfHC2qGxHoECKzZ8RTlXA2inyJu3jpSuXDXzNjRICUzxDkAMpZKy9qR7nHTIqbPUiH1Ca2Lcnu9+wNTJ2lpam/Ve1YkO1/95ai1pS1KgRhXdAxS7xpRvui4u08h4gsjGL/9FUtIJ2hX+1pAEs4bdiK0epP7jUj+PbrP2LxRMIU7I6xHIApySj+qR4M03vzMpt0mUOq/XtuaXHA4Pk7MSuQllPyzuTlFAbeR5+SeH3SGDc49MGpgf84odEaAbnX8ODXHCb9ojHqDAmaME3YLWAPKZr4atURmyxoy1HVWE5jPAzS30nriVlmXD0K2+bEdMkToLVp5a1tO/bg35HwlBQgbE+l55DR1142d5PGm5OZ9VbczZK73ZkyAG2BFdhCPMp2KwGS/IVKOLabx7fZ9ggV2c865aneJ7dBu8ak/CiSlst67lR0KG8o45M= anmol@Anmols-MacBook-Air.local"
}

provider "aws" {
  profile = "Terraform"
  region  = "ap-south-1"
}

resource "aws_instance" "vm-web" {
  ami           = "ami-041d6256ed0f2061c"
  instance_type = "t2.micro"

  tags = {
    Name = "server for web"
    Env = "dev"
  }
}
