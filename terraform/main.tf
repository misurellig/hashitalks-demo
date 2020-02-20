resource "vault_mount" "hashitalks_kv" {
  path = "kv"
  type = "generic"
}

resource "vault_generic_secret" "demo_secrets" {
  path = "kv/pipeline-secrets"

  data_json = <<EOT
{
  "secret-1": "i_am_a_secret",
  "secret-2": "give_me_the_piece_of_cake"
}
EOT
 depends_on = [vault_mount.hashitalks_kv]
}

resource "vault_policy" "pipeline_policy" {
  name = "pipeline-policy"

  policy = <<EOT
path "kv/data/pipeline-secrets" {
  policy = "read"
}

path "kv/pipeline-secrets" {
  policy = "read"
}
EOT
}

resource "vault_policy" "trusted_entity_policy" {
  name = "trusted-entity"

  policy = <<EOT
path "auth/pipeline/role/pipeline-approle/secret-id" {
  policy = "write"
  min_wrapping_ttl   = "100s"
  max_wrapping_ttl   = "300s"
}
EOT
}

resource "vault_auth_backend" "pipeline_access" {
  type = "approle"
  path = "pipeline"
}

resource "vault_approle_auth_backend_role" "pipeline_approle" {
  backend            = vault_auth_backend.pipeline_access.path
  role_name          = "pipeline-approle"
  secret_id_num_uses = "1"
  secret_id_ttl      = "300"
  token_ttl          = "1800"
  token_policies     = ["default", "pipeline-policy"]
}
