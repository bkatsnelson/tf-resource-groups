output "rg_postgres_name" {
  value = module.resource_groups.rg_postgres_name
}
output "rg_sql_name" {
  value = module.resource_groups.rg_sql_name
}
output "rg_aks_name" {
  value = module.resource_groups.rg_aks_name
}
output "rg_app_service_name" {
  value = module.resource_groups.rg_app_service_name
}
output "rg_vm_name" {
  value = module.resource_groups.rg_vm_name
}
output "subscription_id" {
  value = var.subscription_id
}
output "tenant_id" {
  value = data.terraform_remote_state.network_shared.outputs.tenant_id
}
