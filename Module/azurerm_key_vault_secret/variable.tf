variable "kvs" {
  description = "Map of keyvaults to create. Each value is an object with name, location, resource_group and secrets (list of objects { name, value })."
  type = map(object({
    kv_name                     = string
    # location                    = string
    resource_group_name         = string
    secret_name                 = string
    secret_value           = string
  }))
}
