provider "aws" {
  region = "ap-southeast-1"
}


module "neptune" {
  source                         = "./modules/neptune"
  cluster_identifier             = "${var.cluster_identifier}"
  engine_version                 = "${var.engine_version}"
#  kms_key_arn                    = "${module.s3.kms_key_arn}"
#  iam_roles                      = "${var.iam_roles}"
  neptune_cluster_instance_count = "2"
  is_publicly_accessible         = "${var.is_publicly_accessible}"
  neptune_subnet_group_name      = "${var.neptune_subnet_group_name}"
  subnet_ids                     = "${var.private_subnet_ids}"
  neptune_sg_name                = ["${var.my_sg_name}"]
  tags                           = "${var.tags}"
}
