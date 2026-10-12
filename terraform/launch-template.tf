data "aws_ami" "ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_launch_template" "lt" {
  name_prefix   = "project-app-"
  image_id      = data.aws_ami.ami.id
  instance_type = "t3.micro"

  vpc_security_group_ids = [aws_security_group.app-sg.id]

  iam_instance_profile {
    name = aws_iam_instance_profile.ssm_instance_profile.name
  }

  user_data = base64encode(<<-EOF
    #!/bin/bash
    dnf install -y nginx
    systemctl enable --now nginx
  EOF
  )


  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "project"
    }
  }
}