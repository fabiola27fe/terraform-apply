# Instancia AWS EC2

## Entradas

### Obligatorias

| Nombre | Tipo | Descripción |
|--------|------|-------------|
| os | string | Sistema operativo para desplegar: "rhel82", "rhel88", "al23" o "w2k22". |
| hostname | string | Nombre a asignar a la instancia. Talos lo generará a partir de hostname_prefix. |
| subnet_name | string | Nombre de la subnet en la que desplegar la máquina. |

### Opcionales

| Nombre | Tipo | Por defecto | Descripción |
|--------|------|-------------|-------------|
| disk_size | number | 50 | Tamaño del disco raíz en GB |
| size | string | "S" | Tamaño de instancia a desplegar: "S", "M" o "L" |
| ssm_parameter_name | string | "" | Nombre de parámetro SSM bajo el que almacenar el Instance Id y la IP Privada de la instancia creada, no se almacenarán si la cadena está vacía |
| tags | map(string) | {} | Etiquetas adicionales |

#### Almacenamiento opcional de Instance Id e IP Privada en SSM Parameter Store

Si se proporciona un valor no vacío para **ssm_parameter_name**, se
almacenarán el Instance Id y la dirección IP privada de la instancia de
la siguiente manera en SSM Parameter Store:

- Poseidon-IaaS/*ssm_parameter_name*/id contendrá el Instance Id
- Poseidon-IaaS/*ssm_parameter_name*/name contendrá el hostname
- Poseidon-IaaS/*ssm_parameter_name*/private_ip contendrá la dirección IP privada

Más información en [documento adicional](SSM_Parameter_Store_Consumption.md).

### Ejemplo completo

```json
{
    "os": "rhel82",
    "hostname_prefix": "LESAWSWEUD",
    "size": "M",
    "disk_size": 100,
    "subnet_name": "private-0-subnet",
    "ssm_parameter_name": "/IaaS/instances/web1",
    "tags": {
        "env": "Dev"
    }
}
```

## Salidas

| Nombre | Tipo | Descripción |
|--------|------|-------------|
| hostname | string | Nombre de la instancia creada |
| id | string | Identificador de instancia |
| ip_address | string | Dirección IPv4 de la instancia |
| instance_state | string | Estado de la instancia |
| private_dns | string | Nombre DNS privado de la instancia |
| tags_all | map(string) | Listado completo de etiquetas de la instancia |

### Ejemplo

```json
{
    "hostname": "LESAWSEUD12345",
    "id": "i-1234567890",
    "ip_address": "10.10.10.10",
    "instance_state": "Running",
    "private_dns": "ip-10-10-10-10",
    "tags_all": {
        "Name": "LESAWSEUD12345",
        "env": "Dev"
    }
}
```
