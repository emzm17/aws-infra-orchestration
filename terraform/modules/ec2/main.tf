resource "aws_instance" "machine" {
    ami = var.ami_id
    instance_type = var.instance_type
    subnet_id = var.subnet_type
    vpc_security_group_ids =  var.security_groups
    tags = var.tags
    associate_public_ip_address=var.public_ip
    key_name = var.key
}


