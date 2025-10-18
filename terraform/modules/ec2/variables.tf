variable "tags" {
  type = map(string)
}
variable "subnet_type" {}
variable "ami_id" {}
variable "instance_type" {}
variable "security_groups" {
   type = list(string)
}

variable "public_ip" {
}

variable "key" {
}
