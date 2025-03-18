module "instance_id_store" {
  source  = "terraform-aws-modules/ssm-parameter/aws"
  version = "1.1.1"

  create = local.ssm_parameter_name != ""

  name  = "${local.ssm_parameter_prefix}/id"
  value = module.this.id
}

module "name_store" {
  source  = "terraform-aws-modules/ssm-parameter/aws"
  version = "1.1.1"

  create = local.ssm_parameter_name != ""

  name  = "${local.ssm_parameter_prefix}/name"
  value = var.hostname

  depends_on = [module.this]
}

module "private_ip_store" {
  source  = "terraform-aws-modules/ssm-parameter/aws"
  version = "1.1.1"

  create = local.ssm_parameter_name != ""

  name  = "${local.ssm_parameter_prefix}/private_ip"
  value = module.this.private_ip
}
