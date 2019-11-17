resource "aws_neptune_cluster" "neptune_cluster" {
  cluster_identifier                  = "${var.cluster_identifier}"
  engine                              = "neptune"
  backup_retention_period             = 7
  preferred_backup_window             = "${var.preferred_backup_window_neptune}"
  preferred_maintenance_window        = "${var.preferred_maintenance_window_neptune}"
  neptune_subnet_group_name           = "${aws_neptune_subnet_group.neptune_subnet_group.id}"
#  iam_roles                           = "${var.iam_roles}"
#  kms_key_arn                         = "${var.kms_key_arn}"
#  storage_encrypted                   = "${var.kms_key_arn == "" ? false : true}"
  skip_final_snapshot                 = true
  vpc_security_group_ids              = "${var.neptune_sg_name}"
  iam_database_authentication_enabled = false
}

resource "aws_neptune_cluster_instance" "neptune_cluster_instance" {
  count                      = "${var.neptune_cluster_instance_count}"
  identifier                 = "${var.cluster_identifier}-${count.index}"
  cluster_identifier         = "${aws_neptune_cluster.neptune_cluster.id}"
  neptune_subnet_group_name  = "${aws_neptune_subnet_group.neptune_subnet_group.id}"
  publicly_accessible        = "${var.is_publicly_accessible}"
  engine                     = "neptune"
  instance_class             = "${var.instance_class}"
  auto_minor_version_upgrade = false
}

resource "aws_neptune_subnet_group" "neptune_subnet_group" {
  name        = "${var.neptune_subnet_group_name}"
  subnet_ids  = "${var.subnet_ids}"
  description = "Managed by Terraform"
  tags        = "${var.tags}"
}
