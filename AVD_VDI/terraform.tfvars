# Customized the sample values below for your environment and either rename to terraform.tfvars or env.auto.tfvars

deploy_location      = "west europe"
rg_name              = "my1rg"
tags_name = {
        App               = "AVD"
        Owner             = "IT"
        Confidentiality   = "Internal"
        CostCenter        = "IT"
        Dept              = "IT"
        Env               = "PROD"
        BusinessImpact    = "Moderate"
        MaintenanceWindow = "Sat:6:00AM-Sat:11:00AM"
        Hostpool = "my1hp"
}
rdsh_count = "2"
prefix = "VDItest"

domain_user_upn = "svc_avd"
vm_size = "Standard_D2as_v5"
ou_path = ""
local_admin_username = "avdadmin"
existingVnetName = "my1vnet"
existingSubnetName = "my1subnet"
existingWVDAppGroupName = "my1appgr"
existingWVDHostPoolName = "my1hp"
existingWVDWorkspaceName = "my1workspace"
drainmode = "no"
createWorkspaceAppGroupAsso = "No"
SubscriptionId = "1e5d5a77-5bb8-493e-9a80-87271fc0c024"


