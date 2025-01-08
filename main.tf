
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


resource "azurerm_role_assignment" "secret_role" {
  # Assign the Secret Officer role to the Azure AD group for each secret
  principal_id       = var.role_definition_name 
  role_definition_name = var.role_definition_name
  scope              = azurerm_key_vault_secret.secret.id
}
