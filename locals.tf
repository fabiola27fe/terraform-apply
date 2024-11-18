locals {
  os = {
    rhel88 = {
      owner     = "257394448040"
      name_glob = "rhel88"
      user_data = data.cloudinit_config.linux.rendered
    }

  }

  size = {
    S = {
      instance_type = "c6a.large"
    }

    M = {
      instance_type = "c6a.xlarge"
    }

    L = {
      instance_type = "c6a.2xlarge"
    }
  }

  ssm_prefix           = "ssm-tfg"
  ssm_parameter_name   = var.ssm_parameter_name != null ? var.ssm_parameter_name : ""
  ssm_parameter_prefix = length(regexall("^/", local.ssm_parameter_name)) > 0 ? "/${local.ssm_prefix}${local.ssm_parameter_name}" : "/${local.ssm_prefix}/${local.ssm_parameter_name}"
}
