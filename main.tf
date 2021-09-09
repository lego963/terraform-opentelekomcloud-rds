###################################
# Get ID of created RDSv3 Instance
###################################
locals {
  rds_instance_id = var.create_rds ? concat(opentelekomcloud_rds_instance_v3.this.*.id, [""])[0] : var.rds_instance_id
}

########################
# RDSv3 Perameter Group
########################

resource "opentelekomcloud_rds_parametergroup_v3" "this" {
  count = length(var.parametergroup_values) > 0 ? 1 : 0

  name        = "${prefix}_parametergroup"
  description = var.parametergroup_description
  values      = var.parametergroup_values
  datastore {
    type    = lower(var.db_type)
    version = var.db_version
  }
}

#################
# RDSv3 Instance
#################

resource "opentelekomcloud_rds_instance_v3" "this" {
  count = var.create_rds ? 1 : 0

  availability_zone = var.availability_zone
  db {
    password = var.db_password
    type     = var.db_type
    version  = var.db_version
    port     = var.db_port
  }
  name              = "${prefix}_rds_instance"
  security_group_id = var.secgroup_id
  subnet_id         = var.network_id
  vpc_id            = var.vpc_id
  volume {
    type               = var.volume_type
    size               = var.volume_size
    disk_encryption_id = var.volume_encryption_id
  }
  flavor              = var.flavor
  ha_replication_mode = var.ha_enable ? var.ha_replication_mode : null

  backup_strategy {
    start_time = var.backup_start_time
    keep_days  = var.backup_keep_days
  }

  param_group_id = length(var.parametergroup_values) > 0 ? concat(opentelekomcloud_rds_parametergroup_v3.parametergroup.*.id)[0] : null
}

##############################
# RDSv3 Read Replica Instance
##############################

resource "opentelekomcloud_rds_read_replica_v3" "this" {
  count = length(var.read_replica_config) > 0 ? length(var.read_replica_config) : 0

  name              = var.read_replica_config[count.index]["name"]
  flavor            = var.read_replica_config[count.index]["flavor"]
  availability_zone = var.read_replica_config[count.index]["availability_zone"]
  replica_of_id     = local.rds_instance_id

  volume {
    type               = var.read_replica_config[count.index]["volume_type"]
    disk_encryption_id = var.read_replica_config[count.index]["volume_encryption_id"]
  }
}
