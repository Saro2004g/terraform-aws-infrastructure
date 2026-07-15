variable "region" {
  description = "AWS region"
  type        = string
}

variable "ami_id" {
  description = "AMI ID"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
}

variable "public_subnet_cidr" {
  description = "Public subnet CIDR block"
  type        = string
}

variable "bucket_name" {
  description = "S3 bucket name"
  type        = string
}

variable "key_name" {
  description = "EC2 key pair name"
  type        = string
}

variable "availability_zone" {
  description = "Availability Zone"
  type        = string
}
variable "public_subnet_2_cidr" {
  type = string
}

variable "availability_zone_2" {
  type = string
}
