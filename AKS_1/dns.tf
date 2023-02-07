resource "azurerm_dns_zone" "example-public" {
  name                = "ahan.world"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_dns_a_record" "example" {
  name                = "test"
  zone_name           = azurerm_dns_zone.example-public.name
  resource_group_name = azurerm_resource_group.rg.name
  ttl                 = 60
  target_resource_id  = data.azurerm_public_ip.network-1.id
}