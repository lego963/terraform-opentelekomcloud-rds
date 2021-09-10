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
module "db" {
  source = "terraform-opentelekomcloud-modules/rds/opentelekomcloud"
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

| Name                                                                                    | Description                                            | Type           | Default      | Required |
| --------------------------------------------------------------------------------------- | ------------------------------------------------------ | -------------- | ------------ | :------: |
| <a name="input_prefix"></a> [prefix](#input\_prefix)                                    | Prefix for basic network infra.                        | `string`       | `"default"`  |    no    |
| <a name="input_tags"></a> [tags](#input\_tags)                                          | The key/value pairs to associate with the VPC and      | `map(string)`  | `{}`         |    no    |
| <a name="input_snat_enable"></a> [snat\_enable](#input\_snat\_enable)                   | SNAT should be used or not                             | `bool`         | `false`      |    no    |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr)                            | IP range for the VPC                                   | `string`       | `null`       |   yes    |
| <a name="input_subnet_cidr"></a> [subnet\_cidr](#input\_subnet\_cidr)                   | IP range for the subnet                                | `string`       | `null`       |   yes    |
| <a name="input_gateway_ip"></a> [gateway\_ip](#input\_gateway\_ip)                      | The gateway of the subnet                              | `string`       | `null`       |   yes    |
| <a name="input_dns_nameservers"></a> [dns\_nameservers](#input\_dns\_nameservers)       | An array of DNS name servers used by hosts in the      | `list(string)` | ``           |    no    |
| <a name="input_ntp_addresses"></a> [ntp\_addresses](#input\_ntp\_addresses)             | An array of NTP server addresses configured for the    | `list(string)` | ``           |    no    |
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | The availability zone (AZ) to which the subnet belongs | `string`       | `"eu-de-01"` |    no    |
| <a name="input_dhcp_enable"></a> [dhcp\_enable](#input\_dhcp\_enable)                   | DHCP function is enabled for the subnet                | `bool`         | `null`       |    no    |

## Outputs

| Name                                                                                        | Description                             |
| ------------------------------------------------------------------------------------------- | --------------------------------------- |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id)                                    | The ID of the VPC                       |
| <a name="output_vpc_name"></a> [vpc\_name](#output\_vpc\_name)                              | The Name of the VPC                     |
| <a name="output_vpc_cidr_block"></a> [vpc\_cidr\_block](#output\_vpc\_cidr\_block)          | The CIDR block of the VPC               |
| <a name="output_vpc_enable_snat"></a> [vpc\_enable\_snat](#output\_vpc\_enable\_snat)       | The SNAT function is enabled in the VPC |
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id)                           | The ID of the Subnet                    |
| <a name="output_network_id"></a> [network\_id](#output\_network\_id)                        | The ID of the Network                   |
| <a name="output_subnet_name"></a> [subnet\_name](#output\_subnet\_name)                     | The Name of the Subnet                  |
| <a name="output_subnet_cidr_block"></a> [subnet\_cidr\_block](#output\_subnet\_cidr\_block) | The CIDR block of the Subnet            |
| <a name="output_subnet_dns"></a> [subnet\_dns](#output\_subnet\_dns)                        | The DNS name servers of the Subnet      |


## Authors

Module managed by [Rodion Gyrbu](https://github.com/lego963).

## License

Apache 2 Licensed. See LICENSE for full details.
