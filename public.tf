resource "aws_subnet" "public_subnet_ap-northeast-1a" {
  count = "${var.vpc_count}"

  vpc_id                  = "${aws_vpc.cluster_vpc[count.index].id}"
  cidr_block              = "10.0.0.0/20"
  map_public_ip_on_launch = true
  availability_zone       = "ap-northeast-1a"

  tags = {
    Name = "cluster-public-subnet-1"
  }
}

resource "aws_subnet" "public_subnet_ap-northeast-1b" {
  count                   = "${var.vpc_count}"
  vpc_id                  = "${aws_vpc.cluster_vpc[count.index].id}"
  cidr_block              = "10.0.16.0/20"
  map_public_ip_on_launch = true
  availability_zone       = "ap-northeast-1c"

  tags = {
    Name = "cluster-public-subnet-2"
  }
}

resource "aws_route_table_association" "public_subnet_ap-northeast-1a_association" {
  count          = "${var.vpc_count}"
  subnet_id      = "${aws_subnet.public_subnet_ap-northeast-1a.id}"
  route_table_id = "${aws_vpc.cluster_vpc.main_route_table_id}"
}

resource "aws_route_table_association" "public_subnet_ap-northeast-1b_association" {
  count          = "${var.vpc_count}"
  subnet_id      = "${aws_subnet.public_subnet_ap-northeast-1b.id}"
  route_table_id = "${aws_vpc.cluster_vpc.main_route_table_id}"
}
