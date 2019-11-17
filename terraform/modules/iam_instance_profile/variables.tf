variable "iam_instance_profile_name" {
  type        = "string"
  description = ""
  default     = ""
}
variable "role_name" {
  type        = "string"
  description = ""
  default     = ""
}
variable "assume_role_policy" {
  default = "./files/assumerolepolicy.json"
}
