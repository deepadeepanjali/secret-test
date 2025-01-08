variable "keyvault" {
  description = "Name of keyvault"
  type        = string
}

variable "resourcegroup" {
  description = "The resource group of the Key Vault"
  type        = string
}

variable "secretname" {
  description = "name of secret"
  type        = string
}

variable "secretvalue" {
  description = "value of secret"
  type        = string
}

variable "role_definition_name" {
  description = "Name of role definition for secret"
  type        = string
}

variable "principal_id" {
  description = "objectid of AAD group"
  type        = string
}

