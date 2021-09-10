output "rds_instance_id" {
  description = "ID of the RDSv3 db instance"
  value       = module.rds.rds_instance_id
}

output "rds_instance_name" {
  description = "name of the RDSv3 db instance"
  value       = module.rds.rds_instance_name
}
