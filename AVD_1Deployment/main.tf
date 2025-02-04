module "rg" {
  source          = "../AVD_Resource_group"
  rg_name         = "myrg1"
  deploy_location = "west europe"
}

module "myvnet" {
  source          = "../AVD_Vnet"
  rg_name         = "myrg1"
  deploy_location = "west europe"
  vnet_name       = "avdvnet"
  subnet_name     = "avdsubnet"
  depends_on = [
    module.rg
  ]
}

module "avdstorage" {
  source          = "../AVD_Storage"
  rg_name         = "myrg1"
  deploy_location = "west europe"
  sa_name         = "avdstorsec"
  container_name  = "scriptcont"
  depends_on = [
    module.rg
  ]
}

module "avdworkspace" {
  source          = "../AVD_workspace"
  rg_name         = "myrg1"
  deploy_location = "west europe"
  workspace_name  = "myavdworkspace"
  fr_name         = "anyworkspace"
  descript        = "moj pierwszy workspejs"
  depends_on = [
    module.rg
  ]
}

module "ag_hp" {
  source          = "../AVD_hp_ag"
  rg_name         = "myrg1"
  deploy_location = "west europe"
  hp_descript     = "hostpul"
  hp_name         = "myavdhostpool"
  hp_fr_name      = "anyhostpool"
  appgr_descript  = "aplikajszongroup"
  appgr_disp_name = "Default desktop"
  appgr_fr_name   = "anyappgr"
  appgr_name      = "avdappgroup"
  appgr_type      = "Desktop"
  workspace_id    = module.avdworkspace.workspaid
  depends_on = [
    module.avdworkspace,
  ]
}

module "spn" {
  source          = "../AVD_Service_Principal"
  rg_name         = "myrg1"
  deploy_location = "west europe"
}

module "aadgroups" {
  source          = "../AVD_AAD_Groups"
  rg_name         = "myrg1"
  deploy_location = "west europe"
  depends_on = [
    module.rg
  ]
}

module "azurermroles" {
  source          = "../AVD_AzureRM_roles"
  rg_name         = "myrg1"
  deploy_location = "west europe"
}

module "AVD_VDI" {
  source                      = "../AVD_VDI"
  rg_name                     = "myrg1"
  deploy_location             = "west europe"
  rdsh_count                  = "2"
  prefix                      = "VDItest"
  domain_user_upn             = "svc_avd"
  vm_size                     = "Standard_D2as_v5"
  ou_path                     = ""
  local_admin_username        = "avdadmin"
  existingVnetName            = module.myvnet.vnetnm
  existingSubnetName          = module.myvnet.subnetnm
  existingWVDAppGroupName     = module.ag_hp.appgrnm
  existingWVDHostPoolName     = module.ag_hp.hpnm
  existingWVDWorkspaceName    = module.avdworkspace.workspacenm
  drainmode                   = "no"
  createWorkspaceAppGroupAsso = "No"
  SubscriptionId              = "1e5d5a77-5bb8-493e-9a80-87271fc0c024"
  depends_on = [
    module.ag_hp
  ]
  local_admin_password = "haslo@2022"
  spn-client-id        = "1876012d-803e-4c44-a944-78a393ccd9a3"
  spn-client-secret    = "7748Q~XPNtU.inLL.xGhSDTmEwQC2dWfrFu6Ha9P"
  spn-tenant-id        = "5454a13c-63f1-479a-97f7-2dc768e1b9ca"
  workspaceKey         = ""
  tags_name = {
    App               = "AVD"
    Owner             = "IT"
    Confidentiality   = "Internal"
    CostCenter        = "IT"
    Dept              = "IT"
    Env               = "PROD"
    BusinessImpact    = "Moderate"
    MaintenanceWindow = "Sat:6:00AM-Sat:11:00AM"
    Hostpool          = "my1hp"
  }
}
