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
  description = "(required) The db engine version to use"

  default = ""
}

variable "db_type" {
  type        = string
  description = "(required) The database db engine type to use"

  default = ""
}

variable "rds_instance_id" {
  type        = string
  description = "(optional) The ID of the RDSv3 db instance"

  default = ""
}


######################
# RDSv3 Instance Vars
######################

variable "create_rds" {
  type        = bool
  description = "(optional) Whether to create RDSv3 db instance"

  default = true
}

variable "availability_zone" {
  type        = list(string)
  description = "(required) The Availability Zone list of the RDSv3 instance (Multiple AZ must be specified if you are using HA)"

  default = ["eu-de-01"]
}

variable "vpc_id" {
  type    = string
  default = "(required) The ID of the VPC where to create RDSv3 infrstructure"
}

variable "secgroup_id" {
  type        = string
  description = "(required) ID of existing security group"

  default = ""
}

variable "network_id" {
  type        = string
  description = "(required) ID of the network where to create RDSv3 infrstructure"

  default = ""
}

variable "ha_replication_mode" {
  type        = string
  description = "(optional) Specifies the replication mode for the standby DB instance."

  default = ""
}

variable "db_port" {
  type        = number
  description = "(optional) The port on which the RDSv3 accepts connections"

  default = null
}

variable "db_password" {
  type        = string
  description = "(required) Password for the master DB user."
  sensitive   = true

  default = ""
}

variable "db_flavor" {
  type        = string
  description = "(required) The db instance flavor specification code"

  default = ""
}

variable "volume_type" {
  type        = string
  description = "(required) The volume type of the RDSv3 instance"

  default = "COMMON"
}

variable "volume_size" {
  type        = number
  description = "(required) The volume size of the RDSv3 instance"
}

variable "volume_encryption_id" {
  type        = string
  description = "(optional) The ID for the KMS encryption key"

  default = ""
}

variable "backup_start_time" {
  type        = string
  description = "(required) The window to perform maintenance in. Eg: '00:00-01:00'"

  default = "00:00-01:00"
}

variable "backup_keep_days" {
  type        = number
  description = "(optional) The days to retain backups for"

  default = null
}

variable "tags" {
  type        = map(string)
  description = "(optional) The key/value tag pairs to associate with the RDSv3 db instance"
}

########################
# RDSv3 Parameter Group
########################
variable "parametergroup_values" {
  type        = map(string)
  description = "(optional) Map of the values of the RDSv3 db parameter group"

  default = {}
}

variable "parametergroup_description" {
  type        = string
  description = "(optional) Description of the RDSv3 parameter group to create"

  default = ""
}

##########################
# RDSv3 Read Replica Vars
##########################

variable "read_replica_config" {
  type = list(
    object(
      {
        name                 = string,
        flavor               = string,
        availability_zone    = string,
        public_ips           = list(string),
        volume_type          = string,
        volume_encryption_id = string
      }
    )
  )
  description = "(optional) The configuration of RDSv3 db read replica instances"

  default = []
}
