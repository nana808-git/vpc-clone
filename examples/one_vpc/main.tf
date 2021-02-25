provider "aws" {
  region = "ap-northeast-1"
}

module "vpc" {
  source = "../../"

  cluster_name = "example_vpc"
  vpc_count    = 1
}

output "vpc_id" {
  value = "${module.vpc.vpc_id}"
}
