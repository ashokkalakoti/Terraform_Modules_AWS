variable "cluster_identifier" {
  type        = "string"
  description = ""
  default     = "neptune"
}
variable "engine_version" {
  description = ""
  default     = "1.0.1.0.200233.0"
}
variable "preferred_backup_window_neptune" {
  default     = "01:00-02:00"
}
variable "preferred_maintenance_window_neptune" {
  default = "Sun:09:00-Sun:09:30"
}


variable "neptune_cluster_instance_count" {
  description = ""
  default     = 2
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
  default     = "neptune-subnet-group"
}
variable "subnet_ids" {
  type        = "list"
  description = ""
  default     = ["subnet-123456"]
}
variable "neptune_sg_name" {
  default = "sg-091f69b5e3ffrd432"

}
variable "tags" {
  default = {}
}
