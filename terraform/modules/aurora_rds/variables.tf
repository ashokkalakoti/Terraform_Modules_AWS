variable "rds_cluster_identifier" {
  default = "auroracluster"
}

variable "rds_database_name" {
  default = "auroradb"
}
variable "rds_master_username" {
  default = "aurora"
}

variable "rds_master_password" {
  default = "DBAdmins1234321"
}

variable "rds_engine" {
  type    = "string"
  default = "aurora-postgresql"
}
variable "rds_engine_version" {
  default = 10.7
}

variable "rds_backup_retention_period" {
  default = 5
}
variable "rds_preferred_backup_window" {
  type    = "string"
  default = "00:00-01:00"
}
variable "preferred_maintenance_window" {
  type    = "string"
  default = "Mon:02:00-Mon:03:00"
}
/*
variable "iam_roles" {
  default = []
}
variable "kms_key_id" {}
*/
variable "rds_cluster_instances_count" {
  default = 2
}
variable "rds_instance_class" {
  type    = "string"
  default = "db.t3.medium"
}
variable "is_rds_publicly_accessible" {
  type    = "string"
  default = "false"
}
variable "rds_db_subnet_group_name" {
  type = "string"
  default = "dbsubnet"
}
variable "subnet_ids" {
  type = "list"
  default = ["subnet-0ba19d0c7779f403e", "subnet-0dde839f98376e468"]
}
variable "tags" {
  type = "map"
  default = {
    "Name" = "poc-rds"
  }
}
