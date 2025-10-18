variable "ami_id" {}
variable "pub_sub_1a_cidr" {}
variable "pub_sub_2b_cidr" {}
variable "pri_sub_3a_cidr" {}
variable "pri_sub_4b_cidr" {}
variable "instance_type" {
   type = object({
     jenkins = string
     bastion = string
   })
}
variable "tags" {
   type = object({
      jenkins = map(string)
      bastion = map(string)
   })
}
variable "region" {}
variable "project_name" {}
variable "vpc_cidr" {}