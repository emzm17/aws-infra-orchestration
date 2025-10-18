resource "aws_security_group" "client-sg" {
   name = "client-sg"
   description = "enable http/https access on port 80 for client"
   vpc_id = var.vpc_id


   ingress {
     description = "http access"
     from_port = 80
     to_port = 80
     protocol = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
   }
   ingress {
     description = "ssh access"
     from_port = 22
     to_port = 22
     protocol = "tcp"
     security_groups = [aws_security_group.jenkins-sg.id]
   }

   egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
   }

   tags = {
      name = "client-sg"
   }
    depends_on = [aws_security_group.jenkins-sg ]
}

resource "aws_security_group" "bastion-sg" {
  name = "bastion-sg"
  description = "jumphost purposes"
  vpc_id = var.vpc_id

   ingress {
     description = "ssh access"
     from_port = 22
     to_port = 22
     protocol = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
   }
   egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
   }
   tags = {
      name = "bastion-sg"
   }


}

resource "aws_security_group" "jenkins-sg" {
  name = "jenkins sg"
  description = "jenkins-sg"
  vpc_id = var.vpc_id

   ingress {
     description = "ssh access"
     from_port = 22
     to_port = 22
     protocol = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
   }
    ingress {
     description = "jenkins port"
     from_port = 8080
     to_port = 8080
     protocol = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
   }
   egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
   }
   tags = {
      name = "bastion-sg"
   }
   depends_on = [aws_security_group.bastion-sg ]
}