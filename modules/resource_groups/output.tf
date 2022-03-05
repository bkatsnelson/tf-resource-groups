output "rg_postgres_name" {
  value = azurerm_resource_group.rg-postgres.name
}
output "rg_sql_name" {
  value = azurerm_resource_group.rg-sql.name
}
output "rg_aks_name" {
  value = azurerm_resource_group.rg-aks.name
}
output "rg_app_service_name" {
  value = azurerm_resource_group.rg-app-service.name
}
output "rg_vm_name" {
  value = azurerm_resource_group.rg-vm.name
}
