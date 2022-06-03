module "rg" {
    source = "../AVD_Resource_group"
    rg_name = "myrg1"
    deploy_location = "west europe"
}

module "myvnet" {
    source = "../AVD_Vnet"
    rg_name = "myrg1"
    deploy_location = "west europe"
    vnet_name = "avdvnet"
    subnet_name = "avdsubnet"
}

module "avdstorage" {
    source = "../AVD_Storage"
    rg_name = "myrg1"
    deploy_location = "west europe"
    sa_name = "avdstorsec"
    container_name = "scriptcont"
}

module "avdworkspace" {
    source = "../AVD_workspace"
    rg_name = "myrg1"
    deploy_location = "west europe"
    workspace_name = "myavdworkspace"
    fr_name = "anyworkspace"
    descript = "moj pierwszy workspejs"
}

module "ag_hp" {
    source = "../AVD_hp_ag"
    rg_name = "myrg1"
    deploy_location = "west europe"
    hp_descript = "hostpul"
    hp_name = "myavdhostpool"
    hp_fr_name = "anyhostpool"
    appgr_descript = "aplikajszongroup"
    appgr_disp_name = "Default desktop"
    appgr_fr_name = "anyappgr"
    appgr_name = "avdappgroup"
    appgr_type = "Desktop"
    workspace_id = module.avdworkspace.workspace_id
    depends_on = [
      module.avdworkspace
    ]
}