module "VPC" {
    source                          = "./VPC"
    MANAGEMENT_VPC_CIDR             = "${var.MANAGEMENT_VPC_CIDR}"
    ENVIRONMENT                     = "${var.ENVIRONMENT}"
    PROJECT_NAME                    = "${var.PROJECT_NAME}"
    MODULE_NAME                     = "${var.MODULE_NAME}"
}

module "EC2" {
    source                          = "./EC2"
    MANAGEMENT_VPC_ID               = "${module.VPC.MANAGEMENT_VPC_ID}"
    MANAGEMENT_SUBNET_IDS           = "${module.VPC.MANAGEMENT_SUBNET_IDS}"
    ENVIRONMENT                     = "${var.ENVIRONMENT}"
    PROJECT_NAME                    = "${var.PROJECT_NAME}"
    MODULE_NAME                     = "${var.MODULE_NAME}"
}
