output "MANAGEMENT_VPC_ID" {
  value = "${aws_vpc.management-vpc.id}"
}

output "MANAGEMENT_SUBNET_IDS" {
    value = "${aws_subnet.main.*.id}"
}
