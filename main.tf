module "this" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.5.0"

  name          = var.hostname
  instance_type = local.size[var.size].instance_type

  ami                = data.aws_ami.os.id
  ignore_ami_changes = true

  create_iam_instance_profile = false
  iam_instance_profile        = "instance-profile"

  enable_volume_tags = true
  root_block_device = [
    {
      encrypted   = true
      volume_type = "gp3"
      volume_size = var.disk_size
    }
  ]

  subnet_id                   = data.aws_subnet.subnet.id
  associate_public_ip_address = false
  ipv6_address_count          = 0


  tags = var.tags
}

data "aws_subnet" "subnet" {
  filter {
    name   = "tag:Name"
    values = [var.subnet_name]
  }
}
