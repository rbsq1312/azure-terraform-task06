# terraform.tfvars - Values for input variables

name_pattern            = "cmaz-49b8ddc2-mod6"
location                = "North Europe"
kv_rg_name              = "cmaz-49b8ddc2-mod6-kv-rg"
kv_name                 = "cmaz-49b8ddc2-mod6-kv"
kv_secret_name_admin    = "sql-admin-name"
kv_secret_name_password = "sql-admin-password"
sql_db_sku              = "S2"
firewall_rule_name      = "allow-verification-ip"
allowed_ip_address      = "18.153.146.156" # Verification agent IP
app_service_plan_sku    = "P0v3"
dotnet_version          = "8.0"
creator_tag             = "theodor-laurentiu_robescu@epam.com"
