##############
# Common vars
##############

variable "prefix" {
  type        = string
  description = "(optional) Prefix for RDSv3 infrastructure module"

  default = "default"
}

variable "db_version" {
  type        = string
  description = "(required)"

  default = ""
}

variable "db_type" {
  type        = string
  description = "(required)"

  default = ""
}

variable "rds_instance_id" {
  type        = string
  description = "(optional)"

  default = ""
}


######################
# RDSv3 Instance Vars
######################

variable "create_rds" {
  type        = bool
  description = "(optional)"

  default = true
}

variable "availability_zone" {
  type        = list(string)
  description = "(optional) Availability zones of RDSv3 instance (Multiple AZ must be specified if you are using HA)"

  default = ["eu-de-01"]
}

variable "vpc_id" {
  type    = string
  default = "(required) "
}

variable "network_id" {
  type        = string
  description = "(required) ID of the subnet"

  default = ""
}

variable "ha_replication_mode" {
  type        = string
  description = "(optional) To enable HA of RDS"

  default = ""
}

variable "db_port" {
  type        = string
  description = "(required)"

  default = ""
}

variable "db_password" {
  type        = string
  description = "(required)"

  default = ""
}

variable "db_flavor" {
  type        = string
  description = "(required)"

  default = ""
}

variable "volume_type" {
  type        = string
  description = "(optional)"

  default = "COMMON"
}

variable "volume_size" {
  type        = string
  description = "(required)"
}

variable "volume_encryption_id" {
  type        = string
  description = "(optional)"
}

variable "backup_start_time" {
  type        = string
  description = "(optional)"
}

variable "backup_keep_days" {
  type        = number
  description = "(optional)"
}

########################
# RDSv3 Parameter Group
########################
variable "parametergroup_values" {
  type        = map(string)
  description = "(optional) Map of the values of the RDSv3 parameter group"

  default = {}
}

##########################
# RDSv3 Read Replica Vars
##########################

variable "read_replica_config" {
  type        = list(object({ name = string, flavor = string, availability_zone = string, volume_type = string, volume_encryption_id = string }))
  description = "(optional)"
}
