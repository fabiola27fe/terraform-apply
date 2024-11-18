variable "os" {
  type        = string
  description = "Sistema operativo para desplegar"
}

variable "hostname" {
  type        = string
  description = "Nombre de la instancia"
}

variable "hostname_prefix" {
  type        = string
  description = "Prefijo del nombre de instancia - ignorado por Terraform"
  default     = ""
}

variable "disk_size" {
  type        = number
  description = "Tamaño de disco en GB"
  default     = 50

  validation {
    condition     = var.disk_size == floor(var.disk_size)
    error_message = "El tamaño de disco debe ser entero"
  }

  validation {
    condition     = var.disk_size >= 50
    error_message = "El tamaño de disco debe ser mayor o igual a 50"
  }
}

variable "size" {
  type        = string
  description = "Tamaño de instancia, 'S', 'M' o 'L'"
  default     = "S"

  validation {
    condition     = contains(["S", "M", "L"], var.size)
    error_message = "El tamaño de instancia debe ser uno de S/M/L"
  }
}

variable "subnet_name" {
  type        = string
  description = "Nombre de la subnet"
}

variable "tags" {
  type        = map(string)
  description = "Etiquetas adicionales"
  default     = {}
}

variable "talos_unique_id" {
  type        = string
  description = "Identificador único de Talos, suministrado por el workflow"
  default     = ""
}

variable "ssm_parameter_name" {
  type        = string
  description = "Nombre de parámetro SSM en que almacenar identificador de Instancia"
  default     = ""
}
