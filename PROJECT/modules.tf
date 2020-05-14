module "MANAGEMENT" {
    source                      = "./MODULES/MANAGEMENT"
    MANAGEMENT_VPC_CIDR         = "${var.MANAGEMENT_VPC_CIDR}"
    ENVIRONMENT                 = "${var.ENVIRONMENT}"
    PROJECT_NAME                = "${var.PROJECT_NAME}"
}

module "DEV" {
    source                      = "./MODULES/DEV"
    DEV_VPC_CIDR                = "${var.DEV_VPC_CIDR}"
    ENVIRONMENT                 = "${var.ENVIRONMENT}"
    PROJECT_NAME                = "${var.PROJECT_NAME}"
}
