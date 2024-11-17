#-------------------------------------------
# variables.tf
# - variables used in terraform module
#--------------------------------------------

variable "tags" {
  description = "Common set of tags."
  type        = map(string)
  default     = {}
}

variable "vpc_cidr_block" {}
variable "subnet_cidr_block" {}
variable "availability_zone" {}
variable "env_prefix" {}
variable "instance_type" {}