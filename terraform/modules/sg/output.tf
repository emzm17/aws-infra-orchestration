output "client_sg" {
 value = aws_security_group.client-sg.id
}
output "bastion_sg" {
  value = aws_security_group.bastion-sg.id
}
output "jenkins_sg" {
  value = aws_security_group.jenkins-sg.id
}