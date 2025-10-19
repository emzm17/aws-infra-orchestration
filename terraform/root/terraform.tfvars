ami_id = "ami-0360c520857e3138f"
tags = {
    jenkins = {
      Name = "jenkins"
      Env = "dev"
    }
    bastion = {
      Name ="bastion"
      Env= "all"
    }
}
instance_type = {
  jenkins = "t2.medium"
  bastion = "t3.micro"
}
vpc_cidr = "10.0.0.0/16"
pub_sub_1a_cidr = "10.0.0.0/24"
pub_sub_2b_cidr = "10.0.1.0/24"
pri_sub_3a_cidr = "10.0.2.0/24"
pri_sub_4b_cidr = "10.0.3.0/24"
region="us-east-1"
project_name="env-setup"