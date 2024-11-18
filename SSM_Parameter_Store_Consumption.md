# Uso de datos almacenados en SSM Parameter Store

Si se utiliza el mecanismo de almacenar el Id y la dirección IP de la
instancia en SSM Parameter Store, estos se pueden consumir desde
Terraform de la siguiente manera.

Para `ssm_parameter_store="/maquina"`, utilizaríamos:

```hcl
data "aws_ssm_parameter" "maquina_instance_id" {
  name = "/Poseidon-IaaS/maquina/id"
}

data "aws_ssm_parameter" "maquina_private_ip" {
  name = "/Poseidon-IaaS/maquina/private_ip"
}

data "aws_ssm_parameter" "maquina_hostname" {
  name = "/Poseidon-IaaS/maquina/name"
}

data "aws_instance" "maquina" {
  instance_id = data.aws_ssm_parameter.maquina_instance_id.insecure_value
}

locals {
  maquina_private_ip = data.aws_ssm_parameter.maquina_private_ip.insecure_value
}

output "hostname" {
  value = data.aws_ssm_parameter.maquina_hostname.insecure_value
}
```
