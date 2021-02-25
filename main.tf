resource "aws_vpc" "cluster_vpc" {
  count = "${var.vpc_count}"

  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "Cluster VPC"
  }
}

resource "aws_internet_gateway" "gw" {
  count  = "${var.vpc_count}"
  vpc_id = "${aws_vpc.cluster_vpc[count.index].id}"

  tags = {
    Name = "InternetGateway"
  }
}

resource "aws_route" "internet_access" {
  count                  = "${var.vpc_count}"
  route_table_id         = "${aws_vpc.cluster_vpc[count.index].main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.gw[count.index].id}"
}

resource "aws_eip" "vpc_eip" {
  count      = "${var.vpc_count}"
  vpc        = true
  depends_on = ["aws_internet_gateway.gw"]
}
