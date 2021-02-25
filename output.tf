locals {
  vpc_ids           = "${aws_vpc.cluster_vpc.*.id}"
  public_subnet_1as = "${aws_subnet.public_subnet_ap-northeast-1a.*.id}"
  public_subnet_1bs = "${aws_subnet.public_subnet_ap-northeast-1b.*.id}"
}

output "vpc_id" {
  value = "${length(local.vpc_ids) == 0 ? "" : element(concat(local.vpc_ids, list("")), 0)}"
}

output "public_subnet_1a" {
  value = "${length(local.public_subnet_1as) == 0 ? "" : element(concat(local.public_subnet_1as, list("")), 0)}"
}

output "public_subnet_1b" {
  value = "${length(local.public_subnet_1bs) == 0 ? "" : element(concat(local.public_subnet_1bs, list("")), 0)}"
}
