variable "hostname" {
  description = "The hostname of the VM being provisioned."
  type        = string
  default     = "default-hostname"
  validation {
    condition     = length(trimspace(var.hostname)) > 0
    error_message = "The hostname must not be empty and should not contain any leading or trailing whitespace."
  }
}

variable "environment" {
  description = "The environment of the VM such as 'dev', 'test', 'prod', or 'cluster'."
  type        = string
  default     = "dev"
  validation {
    condition     = contains(["dev", "test", "prod", "cluster"], var.environment)
    error_message = "Environment must be one of 'dev', 'test', 'prod', or 'cluster'."
  }
}

variable "site" {
  description = "The physical or logical site of the VM, such as specific datacenter locations."
  type        = string
  default     = "sydney"
  validation {
    condition     = contains(["sydney", "canberra", "melbourne", "Datacenter"], var.site)
    error_message = "Site must be one of 'sydney', 'canberra', 'melbourne', or 'Datacenter'."
  }
}

variable "storage_profile" {
  description = "Defines the storage profile based on performance or capacity needs."
  type        = string
  default     = "standard"
  validation {
    condition     = contains(["performance", "capacity", "standard", "vsanDatastore"], var.storage_profile)
    error_message = "Storage profile must be one of 'performance', 'capacity', 'standard', or 'vsanDatastore'."
  }
}

variable "tier" {
  description = "The tier of resources allocated to the VM, such as 'gold', 'silver', 'bronze', or 'management'."
  type        = string
  default     = "silver"
  validation {
    condition     = contains(["gold", "silver", "bronze", "Demo Management"], var.tier)
    error_message = "Tier must be one of 'gold', 'silver', 'bronze', or 'Demo Management'."
  }
}

variable "security_profile" {
  description = "Specifies the security profile type for the VM, like 'web-server', 'db-server', or 'ad-server'."
  type        = string
  default     = "web-server"
  validation {
    condition     = contains(["web-server", "db-server", "ad-server"], var.security_profile)
    error_message = "Security profile must be 'web-server', 'db-server', or 'ad-server'."
  }
}

variable "backup_policy" {
  description = "Specifies the frequency of backups such as 'daily', 'weekly', or 'monthly'."
  type        = string
  default     = "weekly"
  validation {
    condition     = contains(["daily", "weekly", "monthly"], var.backup_policy)
    error_message = "Backup policy must be one of 'daily', 'weekly', or 'monthly'."
  }
}

variable "folder_path" {
  description = "The path to the folder in vSphere where the VM will be placed."
  type        = string
  default     = "/Datacenter/vm/Default"
}

variable "vsphere_template_name" {
  description = "The name of the existing vSphere template to be used for deploying the VM."
  type        = string
  default     = "default-template"
}

variable "admin_password" {
  description = "The administrator password for the VM."
  type        = string
  sensitive   = true
  default     = "P@ssw0rd!"
}

variable "workgroup" {
  description = "The workgroup name to be used for a Windows server VM."
  type        = string
  default     = "WORKGROUP"
}

variable "num_cpus" {
  description = "The number of CPUs to assign to the VM."
  type        = number
  default     = 2
}

variable "memory" {
  description = "The amount of memory (in MB) to assign to the VM."
  type        = number
  default     = 4096
}

variable "disk_0_size" {
  description = "The size (in GB) of the VM's primary disk."
  type        = number
  default     = 50
}

variable "gateway" {
  description = "The default gateway IP address for the VM."
  type        = string
  default     = "192.168.1.1"
}

variable "dns_server_list" {
  description = "A list of DNS server IP addresses for the VM."
  type        = list(string)
  default     = ["8.8.8.8", "8.8.4.4"]
}

variable "dns_suffix_list" {
  description = "A list of DNS suffixes for the VM."
  type        = list(string)
  default     = ["example.com", "local"]
}