provider "aws" {
  region = var.region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}
# security group
resource "aws_security_group" "bastion-sg" {
  description = "security group for bastion"
  vpc_id      = var.vpc
  ingress = [
    {
      # ssh port
      description      = "ssh"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = null
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    }
  ]
  egress = [
    {
      description      = "outbound traffic"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = null
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    }
  ]
  tags = {
    "Name"      = "bastion-sg"
    "IaC" = "Terraform"
  }
}
# creating instance
resource "aws_instance" "bastionserver" {
  ami                         = var.ami_id
  availability_zone           = var.availability_zone
  instance_type               = var.instance_type
  key_name                    = var.keyname
 
  count                       = var.instance_count
  security_groups             = ["${aws_security_group.bastion-sg.id}"]
  subnet_id                   = var.subnetid
  associate_public_ip_address = true
  ebs_block_device {
    device_name           = "/dev/xvda"
    volume_size           = 30
    volume_type           = "gp2"
    delete_on_termination = true
    tags = {
      Name = "bastion-storage"
    }
  }
  tags = var.tags
}

