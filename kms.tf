# Create the KMS Vault
resource "oci_kms_vault" "sato_kms_vault" {
    compartment_id = var.compartment # Use a variable for compartment_id
      display_name   = "sato-vault"
      vault_type     = "DEFAULT"
    }

# Create the master symmetric key
resource "oci_kms_key" "sato_secret_key" {
  management_endpoint = oci_kms_vault.sato_kms_vault.management_endpoint
  key_shape {
    algorithm = "AES"
    length    = 256    
  }
  display_name = "sato-secret-encryption-key"
  compartment_id = var.compartment_ocid
}

# Define the secret 
resource "oci_vault_secret" "my_example_secret" {
  compartment_id = var.compartment_ocid
  vault_id       = oci_kms_vault.my_kms_vault.id
  key_id         = oci_kms_key.my_secret_key.id
  secret_name    = "oci_compute_secret"
  enable_auto_generation = var.secret_enable_auto_generation

secret_generation_context {
  generation_type     = "PASSWORD"
  generation_template = "OCI_GENERATED_PASSWORD"
  passphrase_length   = 20  
 }

secret_rules {
  rule_type = "SECRET_REUSE_RULE"
  is_enforced_on_deleted_secret_versions = true
 }

secret_rules {
  rule_type = "SECRET_EXPIRY_RULE"
  secret_version_expiry_interval = "P5D" # Expire in 5 days
 }

}