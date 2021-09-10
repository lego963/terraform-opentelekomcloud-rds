# OpenTelekomCloud RDS Terraform module

Terraform module which creates RDSv3 resources on OpenTelekomCloud.

These types of resources are supported:

* [RDSv3 instance](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/resources/rds_instance_v3)
* [RDSv3 parameter group](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/resources/rds_parametergroup_v3)
* [RDSv3 read replica](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/resources/rds_read_replica_v3)

## Terraform versions

Terraform 0.13 and newer.

## Usage

```hcl
module "vpc" {
  source = "terraform-opentelekomcloud-modules/vpc/opentelekomcloud"

  prefix = "infra"

  availability_zone = "eu-de-01"
  vpc_cidr          = "10.0.0.0/24"
  subnet_cidr       = "10.0.0.0/24"
  gateway_ip        = "10.0.0.1"
  ntp_addresses     = ["10.100.0.33", "10.100.0.34"]

  dhcp_enable = true
  snat_enable = true

  tags = {
    infra = "vpc"
  }
}


module "ssh_sg" {
  source = "terraform-opentelekomcloud-modules/security-group/opentelekomcloud"
  prefix      = "ssh"
  description = "Simple security group for SSH"

  ingress_with_source_cidr = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      source_cidr = "0.0.0.0/0"
    }
  ]
}

module "db" {
  source = "terraform-opentelekomcloud-modules/rds/opentelekomcloud"

  availability_zone = ["eu-de-01"]
  db_password       = "5ecurePa55w0rd@"
  db_type           = "PostgreSQL"
  db_version        = "11"
  secgroup_id       = module.ssh_sg.security_group_id
  network_id        = module.vpc.network_id
  vpc_id            = module.vpc.vpc_id
  db_flavor         = "rds.pg.c2.medium"
  volume_size       = 100

  tags = {
    infra = "rds"
  }
}
```


## Examples

* [Simple RDS intance](https://github.com/terraform-opentelekomcloud-modules/terraform-opentelekomcloud-rds/tree/main/examples/simple-rds)

## Requirements

| Name                                                                                           | Version   |
| ---------------------------------------------------------------------------------------------- | --------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform)                      | >= 0.13   |
| <a name="requirement_opentelekomcloud"></a> [opentelekomcloud](#requirement\_opentelekomcloud) | >= 1.23.9 |

## Modules

No modules.

## Resources

| Name                                                                                                                                                             | Type     |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [opentelekomcloud_rds_parametergroup_v3.this](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/resources/rds_instance_v3)   | resource |
| [opentelekomcloud_rds_instance_v3.this](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/resources/rds_parametergroup_v3)   | resource |
| [opentelekomcloud_rds_read_replica_v3.this](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/resources/rds_read_replica_v3) | resource |

## Inputs

| Name                                                                                                              | Description                                                                                          | Type                                                                                                                                                         | Default         | Required |
| ----------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ | --------------- | :------: |
| <a name="input_prefix"></a> [prefix](#input\_prefix)                                                              | Prefix for RDSv3 infrastructure module                                                               | `string`                                                                                                                                                     | `"default"`     |    no    |
| <a name="input_rds_instance_id"></a> [rds_instance_id](#input\_rds\_instance\_id)                                 | The ID of the RDSv3 db instance                                                                      | `string`                                                                                                                                                     | `""`            |    no    |
| <a name="input_create_rds"></a> [snat_create_rds](#input\_create\_rds)                                            | Whether to create RDSv3 db instance                                                                  | `bool`                                                                                                                                                       | `true`          |    no    |
| <a name="input_availability_zone"></a> [availability_zone](#input\_availability\_zone)                            | The availability zone list of the RDSv3 instance (Multiple AZ must be specified if you are using HA) | `list(string)`                                                                                                                                               | `["eu-de-01"]`  |   yes    |
| <a name="input_vpc_id"></a> [vpc_id](#input\_vpc\_id)                                                             | The ID of the VPC where to create RDSv3 infrstructure                                                | `string`                                                                                                                                                     | `""`            |   yes    |
| <a name="input_secgroup_id"></a> [secgroup_id](#input\_secgroup\_id)                                              | ID of existing security group                                                                        | `string`                                                                                                                                                     | `""`            |   yes    |
| <a name="input_network_id"></a> [network_id](#input\_network\_id)                                                 | ID of the network where to create RDSv3 infrstructure                                                | `string`                                                                                                                                                     | `""`            |   yes    |
| <a name="input_db_type"></a> [db_type](#input\_db\_type)                                                          | The database db engine type to use                                                                   | `string`                                                                                                                                                     | `""`            |   yes    |
| <a name="input_db_version"></a> [db_version](#input\_db\_version)                                                 | The db engine version to use                                                                         | `string`                                                                                                                                                     | `""`            |   yes    |
| <a name="input_db_port"></a> [db_port](#input\_db\_port)                                                          | The port on which the RDSv3 accepts connections                                                      | `number`                                                                                                                                                     | `null`          |    no    |
| <a name="input_db_password"></a> [db_password](#input\_db\_password)                                              | Password for the master DB user                                                                      | `string`                                                                                                                                                     | `""`            |   yes    |
| <a name="input_db_flavor"></a> [db_flavor](#input\_db\_flavor)                                                    | The db instance flavor specification code                                                            | `string`                                                                                                                                                     | `""`            |   yes    |
| <a name="input_ha_replication_mode"></a> [ha_replication_mode](#input\_ha\_replication\_mode)                     | Specifies the replication mode for the standby DB instance                                           | `string`                                                                                                                                                     | `""`            |    no    |
| <a name="input_volume_type"></a> [volume_type](#input\_volume\_type)                                              | The volume type of the RDSv3 instance                                                                | `string`                                                                                                                                                     | `"COMMON"`      |   yes    |
| <a name="input_volume_size"></a> [volume_size](#input\_volume\_size)                                              | The volume size of the RDSv3 instance                                                                | `number`                                                                                                                                                     | `null`          |   yes    |
| <a name="input_volume_encryption_id"></a> [volume_encryption_id](#input\_volume\_encryption\_id)                  | The ID for the KMS encryption key                                                                    | `string`                                                                                                                                                     | `""`            |    no    |
| <a name="input_backup_start_time"></a> [backup_start_time](#input\_backup\_start\_time)                           | The window to perform maintenance in. Eg: '00:00-01:00'"                                             | `string`                                                                                                                                                     | `"00:00-01:00"` |   yes    |
| <a name="input_backup_keep_days"></a> [backup_keep_days](#input\_backup\_keep\_days)                              | The days to retain backups for                                                                       | `number`                                                                                                                                                     | `null`          |    no    |
| <a name="input_tags"></a> [tags](#input\_tags)                                                                    | The key/value tag pairs to associate with the RDSv3 db instance                                      | `map(string)`                                                                                                                                                | `null`          |    no    |
| <a name="input_parametergroup_values"></a> [parametergroup_values](#input\_parametergroup\_values)                | Map of the values of the RDSv3 db parameter group                                                    | `map(string)`                                                                                                                                                | `{}`            |    no    |
| <a name="input_parametergroup_description"></a> [parametergroup_description](#input\_parametergroup\_description) | Description of the RDSv3 parameter group to create                                                   | `string`                                                                                                                                                     | `""`            |    no    |
| <a name="input_read_replica_config"></a> [read_replica_config](#input\_read\_replica\_config)                     | The configuration of RDSv3 db read replica instances                                                 | `list(object({name = string, flavor = string, availability_zone = string, public_ips = list(string), volume_type = string, volume_encryption_id = string}))` | `[]`            |    no    |


## Outputs

| Name                                                                                                           | Description                               |
| -------------------------------------------------------------------------------------------------------------- | ----------------------------------------- |
| <a name="output_rds_instance_id"></a> [rds_instance_id](#output\_rds\_instance\_id)                            | ID of the RDSv3 db instance               |
| <a name="output_rds_instance_name"></a> [rds_instance_name](#output\_rds\_instance\_name)                      | Name of the RDSv3 db instance             |
| <a name="output_rds_parametergroup_id"></a> [rds_parametergroup_id](#output\_rds\_parametergroup\_id)          | ID of the RDSv3 db parameter group        |
| <a name="output_rds_read_replica_ids"></a> [rds_read_replica_ids](#output\_rds\_read\_replica\_ids)            | IDs of the RDSv3 db read replica          |
| <a name="output_rds_instance_nodes"></a> [rds_instance_nodes](#output\_rds\_instance\_nodes)                   | List of the RDSv3 db instance nodes       |
| <a name="output_rds_instance_private_ips"></a> [rds_instance_private_ips](#output\_rds_instance\_private\_ips) | List of the RDSv3 db instance private IPs |
| <a name="output_rds_instance_public_ips"></a> [rds_instance_public_ips](#output\_rds_instance\_public\_ips)    | List of the RDSv3 db instance public IPs  |

## Authors

Module managed by [Rodion Gyrbu](https://github.com/lego963).

## License

Apache 2 Licensed. See LICENSE for full details.
