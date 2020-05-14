resource "aws_subnet" "main" {
  count                     = "${length(data.aws_availability_zones.available)}"
  vpc_id                    = "${aws_vpc.management-vpc.id}"
  cidr_block                = "${cidrsubnet(var.MANAGEMENT_VPC_CIDR, 8, count.index)}"
  availability_zone         = "${element(data.aws_availability_zones.available.names, count.index)}"
  map_public_ip_on_launch   = true

  tags = {
    Name                    = "${var.PROJECT_NAME}-${var.ENVIRONMENT}-SUBNET-${count.index+1}"
    ENVIRONMENT             = "${var.ENVIRONMENT}"
    PROJECT_NAME            = "${var.PROJECT_NAME}"
    MODULE_NAME             = "${var.MODULE_NAME}"
    CREATED_BY              = "TERRAFORM"
    MODIFIED_ON             = "${timestamp()}"
  }
}

resource "aws_route_table" "public-rt" {
  vpc_id                    = "${aws_vpc.management-vpc.id}"

  route {
    cidr_block              = "0.0.0.0/0"
    gateway_id              = "${aws_internet_gateway.management-gw.id}"
  }

  tags = {
    Name                    = "${var.PROJECT_NAME}-${var.ENVIRONMENT}-RT"
    ENVIRONMENT             = "${var.ENVIRONMENT}"
    PROJECT_NAME            = "${var.PROJECT_NAME}"
    MODULE_NAME             = "${var.MODULE_NAME}"
    CREATED_BY              = "TERRAFORM"
    MODIFIED_ON             = "${timestamp()}"
  }
}

resource "aws_route_table_association" "publicrt-assoc" {
  count                     = "${length(data.aws_availability_zones.available)}"
  subnet_id                 = "${element(aws_subnet.main.*.id,count.index)}"
  route_table_id            = "${aws_route_table.public-rt.id}"
}
