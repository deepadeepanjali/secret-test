
# Fetch keyvault details by keyvaut names
data "azurerm_key_vault" "keyvault" {
  name                = var.keyvault                 # Use each Key Vault name
  resource_group_name = var.resourcegroup   # Provide the resource group name where the Key Vaults exist
}

resource "azurerm_key_vault_secret" "secret" {
  name         = var.secretname 
  value        =  var.secretvalue
  key_vault_id = data.azurerm_key_vault.keyvault.id
}


resource "azurerm_role_assignment" "secretrole" {
  # Assign the Secret Officer role to the Azure AD group for each secret
  principal_id       = var.principal_id
  role_definition_name = var.role_definition_name
  scope              = "${data.azurerm_key_vault.keyvault.id}/secrets/${azurerm_key_vault_secret.secret.name}" #azurerm_key_vault_secret.secret.id
}
