variable "aws_access_key" {
  type    = string
  default = "EgZjaHJvbWUyBggAEE"
}
variable "aws_secret_key" {
  type    = string
  default = "QABgKGIAEMgcIAhAKJH"
}
variable "region" {
  type    = string
  default = "af-south-1"
}
variable "tags" {
  type        = map(string)
  description = "Server tags"
  default = {
    terraform = "true"
    Application      = "Bastion"
  }
}
variable "keyname" {
  type        = string
  description = "ssh key"
  default     = "ringier-ssh-key"
}
variable "instance_type" {
  type        = string
  description = "instance type"
  default     = "t3.nano"
}
variable "ami_id" {
  type        = string
  description = "Ubuntu 22.04"
  default     = "amiami-05759acc7d8973892_id"
}
variable "subnetid" {
  type        = string
  description = "subnet id "
  default     = "subnet-050ab60062fd6989d"
}
variable "vpc" {
  type        = string
  description = "vpc"
  default     = "vpc-070009faaf5f8fdf5"
}
variable "availability_zone" {
  type        = string
  description = "az for bastion"
  default     = "af-south-1a"
}
variable "instance_count" {
  type        = number
  description = "Number of servers"
  default     = 1
}
