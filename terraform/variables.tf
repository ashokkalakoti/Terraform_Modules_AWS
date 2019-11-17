variable "tags" {
  type        = "map"
  description = ""
  default = {
    "Name" = "poc"
  }
}

variable "cluster_identifier" {
  type        = "string"
  description = ""
  default     = "poc-neptune"
}
variable "engine_version" {
  description = ""
  default     = "1.0.1.0.200457.0"
}
variable "preferred_backup_window" {
  type        = "string"
  description = ""
  default     = "00:00-01:00"
}

variable "preferred_backup_window_neptune" {
  type        = "string"
  description = ""
  default     = "01:00-02:00"
}
variable "preferred_maintenance_window_neptune" {
  default = "Sun:09:00-Sun:09:30"
}
variable "iam_roles" {
  default = []
}
variable "neptune_cluster_instance_count" {
  description = ""
  default     = 1
}
variable "is_publicly_accessible" {
  type        = "string"
  description = ""
  default     = "false"
}
variable "instance_class" {
  type        = "string"
  description = ""
  default     = "db.r4.large"
}
variable "neptune_subnet_group_name" {
  type        = "string"
  description = ""
  default     = "fed-in-print-neptune-subnet-group"
}
variable "private_subnet_ids" {
  type        = "list"
  description = ""
  default     = ["subnet-0ba19d0c7779f403e", "subnet-0dde839f98376e468"]
}


variable "my_sg_name" {
  default = "sg-0d84a7bd835032682"
}


## Custom Variables 

variable "vpc_id" {
  description = "description"
  default = "vpc-04507dc695013cce3"
}


data "aws_vpc" "vpc" {
  id = "${var.vpc_id}"
}




