terraform {
  required_version = "=1.0.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# IAM
module "iam" {
  source   = "./modules/iam"
  app_name = var.app_name
}

# network
module "network" {
  source   = "./modules/network"
  app_name = var.app_name
  db_ports = var.db_ports
}

# rds
module "rds" {
  source           = "./modules/rds"
  db_sbg_name      = module.network.db_sbg_name
  sg_rds_source_id = module.network.sg_rds_source_id
  sg_rds_target_id = module.network.sg_rds_target_id
  db_ports         = var.db_ports
  app_name         = var.app_name
  db_name          = var.db_name
  db_username      = var.db_username
  db_password      = var.db_password
}

# opmng
module "ec2" {
  source                     = "./modules/ec2"
  app_name                   = var.app_name
  sg_opmng_id                = module.network.sg_opmng_id
  subnet_public_subnet_1a_id = module.network.subnet_public_subnet_1a_id
  sorce_db_address           = module.rds.sorce_db_address
  db_username                = var.db_username
  db_name                    = var.db_name
  db_password                = var.db_password
}

# dms
module "dms" {
  source                                = "./modules/dms"
  app_name                              = var.app_name
  region                                = var.region
  sg_dms_id                             = module.network.sg_dms_id
  db_name                               = var.db_name
  db_ports                              = var.db_ports
  db_username                           = var.db_username
  db_password                           = var.db_password
  sorce_db_address                      = module.rds.sorce_db_address
  target_db_address                     = module.rds.target_db_address
  subnet_public_subnet_1a_id            = module.network.subnet_public_subnet_1a_id
  subnet_public_subnet_1c_id            = module.network.subnet_public_subnet_1c_id
  subnet_private_subnet_1a_id           = module.network.subnet_private_subnet_1a_id
  subnet_private_subnet_1c_id           = module.network.subnet_private_subnet_1c_id
  iam_role_policy_attachment_dms_policy = module.iam.iam_role_policy_attachment_dms_policy
}
