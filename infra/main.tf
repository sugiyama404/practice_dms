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
  source       = "./modules/rds"
  db_sbg_name  = module.network.db_sbg_name
  sg_rds_sg_id = module.network.sg_rds_sg_id
  db_ports     = var.db_ports
  app_name     = var.app_name
  db_name      = var.db_name
  db_username  = var.db_username
  db_password  = var.db_password
}

# bash
# module "bash" {
#   source           = "./modules/bash"
#   sorce_db_id      = module.rds.sorce_db_id
#   sorce_db_address = module.rds.sorce_db_address
#   db_ports         = var.db_ports
#   db_name          = var.db_name
#   db_username      = var.db_username
#   db_password      = var.db_password
# }
