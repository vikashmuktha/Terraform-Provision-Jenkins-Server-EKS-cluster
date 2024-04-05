# VPC Block
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "Jenkins-Vpc"
  cidr = var.cidr

  azs            = var.azs
  public_subnets = var.public_subnets

  enable_dns_hostnames = true
  enable_dns_support   = true

  map_public_ip_on_launch = true



  tags = {
    Name        = "Jenkins-Vpc"
    Terraform   = "true"
    Environment = "dev"
  }

  public_subnet_tags = {
    Name = "jenkins-subnet"
  }
}


# Security Block
module "sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "jenkins-sg"
  description = "Security Group for Jenkins Server"
  vpc_id      = module.vpc.vpc_id


  ingress_with_cidr_blocks = [
    {
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      description = "jenkins server ports"
      cidr_blocks = "0.0.0.0/0"
    },

    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "SSH"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
    }
  ]

  tags = {
    Name = "Jenkins-Sg"
  }
}


# EC2 Block
module "ec2_instance" {
  source                      = "terraform-aws-modules/ec2-instance/aws"
  name                        = "Jenkins-Server"
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  monitoring                  = true
  vpc_security_group_ids      = [module.sg.security_group_id]
  subnet_id                   = module.vpc.public_subnets[0]
  associate_public_ip_address = true
  user_data                   = file("${path.module}/jenkins-install.sh")
  availability_zone           = var.azs[0]

  tags = {
    Name        = "Jenksin-Server"
    Terraform   = "true"
    Environment = "dev"
  }
}

