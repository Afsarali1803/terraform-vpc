# module "vpc" {
#   source = "git::https://github.com/Afsarali1803/tfmodulevpc.git"
# }

module "vpc" {
    source = "./vendor/modules/vpc"
    VPC_CIDR = var.VPC_CIDR
    ENV      = var.ENV
}
