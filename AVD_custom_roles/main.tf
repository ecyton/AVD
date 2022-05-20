data "azuread_client_config" "current" {}


resource "azuread_group" "AVD_Admin" {
  display_name     = "AVD Admin"
  owners           = [data.azuread_client_config.current.object_id]
  security_enabled = true

  members = [
    azuread_user.example.object_id,
    /* more users */
  ]
}