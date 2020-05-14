resource "aws_vpc" "management-vpc" {
  cidr_block            = "${var.MANAGEMENT_VPC_CIDR}"
  instance_tenancy      = "default"

  tags = {
    Name                = "${var.PROJECT_NAME}-${var.ENVIRONMENT}-VPC"
    ENVIRONMENT         = "${var.ENVIRONMENT}"
    PROJECT_NAME        = "${var.PROJECT_NAME}"
    MODULE_NAME         = "${var.MODULE_NAME}"
    CREATED_BY          = "TERRAFORM"
    MODIFIED_ON         = "${timestamp()}"
  }
}


resource "aws_internet_gateway" "management-gw" {
  vpc_id = "${aws_vpc.management-vpc.id}"

  tags = {
    Name                = "${var.PROJECT_NAME}-${var.ENVIRONMENT}-IGW"
    ENVIRONMENT         = "${var.ENVIRONMENT}"
    PROJECT_NAME        = "${var.PROJECT_NAME}"
    MODULE_NAME         = "${var.MODULE_NAME}"
    CREATED_BY          = "TERRAFORM"
    MODIFIED_ON         = "${timestamp()}"
  }
}
