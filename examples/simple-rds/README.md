# Simple RDSv3 instance

Configuration in this directory creates a VPC, Security Group, Security Rule and RDSv3 DB instance resources which may be sufficient for development environment.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which can cost money. Run `terraform destroy` when you don't need these resources.

## Requirements

| Name                                                                                           | Version   |
| ---------------------------------------------------------------------------------------------- | --------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform)                      | >= 0.13   |
| <a name="requirement_opentelekomcloud"></a> [opentelekomcloud](#requirement\_opentelekomcloud) | >= 1.23.9 |

## Providers

No providers.

## Modules

| Name                                                    | Source                                                             | Version |
| ------------------------------------------------------- | ------------------------------------------------------------------ | ------- |
| <a name="module_rds"></a> [rds](#module\_rds)           | ../../                                                             |         |
| <a name="module_vpc"></a> [vpc](#module\_vpc)           | terraform-opentelekomcloud-modules/vpc/opentelekomcloud            |         |
| <a name="module_ssh_sg"></a> [ssh_sg](#module\_ssh\_sg) | terraform-opentelekomcloud-modules/security-group/opentelekomcloud |         |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name                                                          | Description                       |
| ------------------------------------------------------------- | --------------------------------- |
| <a name="output_rds_id"></a> [rds_id](#output\_rds\_id)       | The ID of the RDSv3 DB instance   |
| <a name="output_rds_name"></a> [rds_name](#output\_rds\_name) | The name of the RDSv3 DB instance |
