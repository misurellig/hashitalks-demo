provider "vault" {
  address     = var.vault_endpoint
  max_retries = 5
}
