source "amazon-ebs" "main" {
  ami_name = "rolling_update_{{timestamp}}"
  region   = "eu-west-1"

  instance_type = "t3.small"

  source_ami_filter {
    filters = {
      virtualization-type = "hvm"
      name                = "amzn2-ami-hvm-2.0.*-x86_64-gp2"
      root-device-type    = "ebs"
    }
    owners      = ["amazon"]
    most_recent = true
  }

  communicator = "ssh"
  ssh_username = "ec2-user"

  vpc_filter {
    filters = {
      isDefault = true
    }
  }

  subnet_filter {
    random = false
  }
}
