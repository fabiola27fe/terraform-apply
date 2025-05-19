output "id" {
  value       = module.this.id
  description = "EC2 Instance ID"
}

output "hostname" {
  value       = var.hostname
  description = "Nombre de la instancia EC2"
}

output "ip_address" {
  value       = module.this.private_ip
  description = "Dirección IP privada de la instancia EC2"
}

output "arn" {
  value       = module.this.arn
  description = "EC2 Instance ARN"
}

output "instance_state" {
  value       = module.this.instance_state
  description = "Estado de la instancia EC2"
}

output "private_dns" {
  value       = module.this.private_dns
  description = "Nombre DNS privado de la instancia EC2"
}

output "instance_id" {
  value = module.this.id
}


output "tags_all" {
  value       = module.this.tags_all
  description = "Etiquetas de la instancia EC2"
}
