locals {
  os = {
    

    al23 = {
      owner     = "257394448040"
      name_glob = "al23"
    }

    
    w2k22 = {
      owner     = "454562515687"
      name_glob = "w2k22-v2"
      user_data = templatefile("${path.module}/provision/setup.ps1.tftpl", {
        hostname = var.hostname
      })
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

  #ssm_prefix           = "Poseidon-IaaS"
  #ssm_parameter_prefix = length(regexall("^/", local.ssm_parameter_name)) > 0 ? "/${local.ssm_prefix}${local.ssm_parameter_name}" : "/${local.ssm_prefix}/${local.ssm_parameter_name}"
  #ssm_parameter_name   = var.ssm_parameter_name != null ? var.ssm_parameter_name : ""
}
