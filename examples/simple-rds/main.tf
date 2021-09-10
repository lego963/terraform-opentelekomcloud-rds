# Configure the OpenTelekomCloud Provider
provider "opentelekomcloud" {
  cloud = "tf"
}

module "vpc" {
  source = "terraform-opentelekomcloud-modules/vpc/opentelekomcloud"

  prefix = "infra"
  cidr   = "10.0.0.0/16"

  availability_zone = "eu-de-01"

  vpc_cidr      = "10.0.0.0/24"
  subnet_cidr   = "10.0.0.0/24"
  gateway_ip    = "10.0.0.1"
  ntp_addresses = ["10.100.0.33", "10.100.0.34"]

  dhcp_enable = true
  snat_enable = true

  tags = {
    infra = "vpc"
  }
}


module "ssh_sg" {
  source      = "terraform-opentelekomcloud-modules/security-group/opentelekomcloud"
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

module "rds" {
  source = "../../"

  availability_zone = ["eu-de-01"]
  db_password       = "5ecurePa55w0rd@"
  db_type           = "PostgreSQL"
  db_version        = "11"
  secgroup_id       = module.ssh_sg.security_group_id
  network_id        = module.vpc.network_id
  vpc_id            = module.vpc.vpc_id
  flavor            = "rds.pg.c2.medium"

  tags = {
    infra = "rds"
  }
}
