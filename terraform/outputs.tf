output "pipeline_approle_roleid" {
  value = vault_approle_auth_backend_role.pipeline_approle.role_id
}

output "pipeline_approle_path" {
  value = vault_auth_backend.pipeline_access.path
}

output "pipeline_approle_rolename" {
  value = vault_approle_auth_backend_role.pipeline_approle.role_name
}