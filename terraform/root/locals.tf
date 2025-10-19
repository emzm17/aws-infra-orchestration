locals {
  instances = {
    jenkins = {
      ami_id          = var.ami_id
      instance_type   = var.instance_type.jenkins
      tags            = var.tags.jenkins
      subnet_type     = module.vpc.pub_sub_1a_id
      security_groups = [module.security_groups.jenkins_sg]
      public_ip= "true"
      key="bbvm"

    }
    # web = {
    #   ami_id          = var.ami_id
    #   instance_type   = var.instance_type.bastion
    #   tags            = var.tags.bastion
    #   subnet_type     = module.vpc.pub_sub_1a_id
    #   security_groups = [module.security_groups.client_sg]
    #   public_ip= "true"
    #   key="bbvm"
    # }
  }
}
