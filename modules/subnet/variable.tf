variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "public_subnet_cidr" {
  description = "Public subnet 1 CIDR block"
  type        = string
}

variable "availability_zone" {
  description = "Availability Zone"
  type        = string
}

variable "public_subnet_2_cidr" {
  description = "Public subnet 2 CIDR block"
  type        = string
}

variable "availability_zone_2" {
  description = "Availability Zone 2"
  type        = string
}
