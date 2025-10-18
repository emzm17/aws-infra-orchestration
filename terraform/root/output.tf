output "public_ip" {
  value = {
    for  k, mod in module.servers : k => mod.public_ip
  }
}