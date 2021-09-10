output "rds_instance_id" {
  description = "ID of the RDSv3 db instance"
  value       = local.rds_instance_id
}

output "rds_parametergroup_id" {
  description = "ID of the RDSv3 db parameter group"
  value       = opentelekomcloud_rds_parametergroup_v3.this.*.id
}

output "rds_read_replica_ids" {
  description = "IDs of the RDSv3 db read replica"
  value       = opentelekomcloud_rds_read_replica_v3.this.*.id
}

output "rds_instance_nodes" {
  description = "List of the RDSv3 db instance nodes"
  value       = opentelekomcloud_rds_instance_v3.this.*.nodes
}

output "rds_instance_private_ips" {
  description = "List of the RDSv3 db instance private IPs"
  value       = opentelekomcloud_rds_instance_v3.this.*.private_ips
}

output "rds_instance_public_ips" {
  description = "List of the RDSv3 db instance public IPs"
  value       = opentelekomcloud_rds_instance_v3.this.*.public_ips
}
