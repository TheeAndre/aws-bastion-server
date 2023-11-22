output "security_grp_id" {
  description = "securitygrp-id"
  value       = aws_security_group.bastion-sg.id
}
output "instance_ids" {
  description = "id"
  value       = ["${aws_instance.bastionserver.*.id}"]
}
output "instance_states" {
  description = "state"
  value       = ["${aws_instance.bastionserver.*.instance_state}"]
}
output "public_dns" {
  description = "public-dns"
  value       = ["${aws_instance.bastionserver.*.public_dns}"]
}
output "public_ips" {
  description = "public-ip"
  value       = ["${aws_instance.bastionserver.*.public_ip}"]
}
output "instance_arns" {
  description = "arn"
  value       = ["${aws_instance.bastionserver.*.arn}"]
}
output "keyname" {
  description = "keyname"
  value       = ["${aws_instance.bastionserver.*.key_name}"]
}