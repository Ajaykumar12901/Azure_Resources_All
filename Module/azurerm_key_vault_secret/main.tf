data "azurerm_client_config" "current" {}

data "azurerm_key_vault" "kvs" {
  for_each            = var.kvs
  name                = each.value.kv_name
  resource_group_name = each.value.resource_group_name
}


resource "azurerm_key_vault_secret" "secret" {
  for_each     = var.kvs
  name         = each.value.secret_name
  value        = each.value.secret_value
  key_vault_id = data.azurerm_key_vault.kvs[each.key].id
}