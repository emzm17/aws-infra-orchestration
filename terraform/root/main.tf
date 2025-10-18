module "vpc" {
  source = "../modules/vpc"
  vpc_cidr = var.vpc_cidr
  pub_sub_1a_cidr = var.pub_sub_1a_cidr
  pub_sub_2b_cidr = var.pub_sub_2b_cidr
  pri_sub_3a_cidr = var.pri_sub_3a_cidr
  pri_sub_4b_cidr = var.pri_sub_4b_cidr
  project_name = var.project_name
}

module "security_groups" {
   source = "../modules/sg"
   vpc_id = module.vpc.vpc_id
}

module "nat" {
  source = "../modules/nat"
  vpc_id = module.vpc.vpc_id
  pri_sub_3a_id = module.vpc.pri_sub_3a_id
  pri_sub_4b_id = module.vpc.pri_sub_4b_id
  pub_sub_1a_id = module.vpc.pub_sub_1a_id
  igw_id = module.vpc.igw_id
}


module "servers" {
  source = "../modules/ec2"
  for_each = local.instances
  ami_id =  each.value.ami_id
  instance_type = each.value.instance_type
  tags = each.value.tags
  subnet_type = each.value.subnet_type
  security_groups = each.value.security_groups
  public_ip = each.value.public_ip
  key=each.value.key
}



