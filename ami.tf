data "aws_ami" "os" {
  most_recent = true
  owners      = [local.os[var.os].owner]

  filter {
    name   = "name"
    values = [local.os[var.os].name_glob]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}