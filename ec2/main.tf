#-------------------------------------------
# main.tf
# - main terraform module functionality
#--------------------------------------------
# Fetch the latest Amazon Linux Image (AMI) owned by AWS
data "aws_ami" "latest-amazon-linux-image" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

#aws instance module
module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name                        = "jenkins-server"
  ami                         = data.aws_ami.latest-amazon-linux-image.id
  instance_type               = var.instance_type
  key_name                    = "ssh_key"
  monitoring                  = true
  vpc_security_group_ids      = [aws_default_security_group.jenkins-sg.id]
  subnet_id                   = aws_subnet.jenkins-subnet-1.id
  availability_zone           = var.availability_zone
  associate_public_ip_address = true
  user_data                   = file("jenkins-script.sh")
  tags = {
    Name = "${var.env_prefix}-server"
  }
}