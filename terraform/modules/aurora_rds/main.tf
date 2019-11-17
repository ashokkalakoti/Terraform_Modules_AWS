resource "aws_rds_cluster" "rds_cluster" {
  cluster_identifier                  = "${var.rds_cluster_identifier}"
  database_name                       = "${var.rds_database_name}"
  master_username                     = "${var.rds_master_username}"
  master_password                     = "${var.rds_master_password}"
  engine                              = "${var.rds_engine}"
  engine_version                      = "${var.rds_engine_version}"
  backup_retention_period             = "${var.rds_backup_retention_period}"
  preferred_backup_window             = "${var.rds_preferred_backup_window}"
  db_subnet_group_name                = "${aws_db_subnet_group.db_subnet_group.id}"
  preferred_maintenance_window        = "${var.preferred_maintenance_window}"
 # iam_roles                           = "${var.iam_roles}"
 # kms_key_id                          = "${var.kms_key_id}"
 # storage_encrypted                   = "${var.kms_key_id == "" ? false : true}"
  skip_final_snapshot                 = true
  iam_database_authentication_enabled = true
  apply_immediately                   = false

}
resource "aws_rds_cluster_instance" "rds_cluster_instances" {
  count                      = "${var.rds_cluster_instances_count}"
  identifier                 = "${var.rds_cluster_identifier}-${count.index}"
  cluster_identifier         = "${aws_rds_cluster.rds_cluster.id}"
  instance_class             = "${var.rds_instance_class}"
  db_subnet_group_name       = "${aws_db_subnet_group.db_subnet_group.id}"
  publicly_accessible        = "${var.is_rds_publicly_accessible}"
  engine                     = "${var.rds_engine}"
  engine_version             = "${var.rds_engine_version}"
  apply_immediately          = false
  auto_minor_version_upgrade = false
  performance_insights_enabled = true

}
resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "${var.rds_db_subnet_group_name}"
  subnet_ids = "${var.subnet_ids}"
  tags       = "${var.tags}"
}

provider "aws" {
  region = "ap-southeast-1"
}
