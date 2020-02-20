provider "vault" {
  address     = var.vault_endpoint
  namespace   = var.namespace
  max_retries = 5
}
