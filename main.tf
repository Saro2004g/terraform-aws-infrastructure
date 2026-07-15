module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
}

module "subnet" {
  source               = "./modules/subnet"
  vpc_id               = module.vpc.vpc_id
  public_subnet_cidr   = var.public_subnet_cidr
  availability_zone    = var.availability_zone

  public_subnet_2_cidr = var.public_subnet_2_cidr
  availability_zone_2  = var.availability_zone_2
}

module "igw" {
  source = "./modules/igw"
  vpc_id = module.vpc.vpc_id
}

module "security_group" {
  source = "./modules/securitygroup"
  vpc_id = module.vpc.vpc_id
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = var.bucket_name
}

module "launch_template" {
  source            = "./modules/launchtemplate"
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  key_name          = var.key_name
  security_group_id = module.security_group.sg_id
}

module "alb" {
  source            = "./modules/elb"
  security_group_id = module.security_group.sg_id
  subnet_ids = [
  module.subnet.public_subnet_1_id,
  module.subnet.public_subnet_2_id
]
  vpc_id            = module.vpc.vpc_id
}

module "asg" {
  source             = "./modules/asg"
  subnet_ids = [
  module.subnet.public_subnet_1_id,
  module.subnet.public_subnet_2_id
]
  launch_template_id = module.launch_template.launch_template_id
  target_group_arn   = module.alb.target_group_arn
}  
