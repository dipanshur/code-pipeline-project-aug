variable "bucket_identifier" {
    description = "Name of the bucket"
    type = string
  
}

variable "batchCode" {
    description = "Batch code for the resource"
    type = string
  
}

variable "typeofBatch" {
    description = "Type of batch"
    type = string
  
}

variable "CreatedBy" {
    description = "User who created the resource"
    type = string
  
}

variable "vpc_cidr" {
    description = "VPC CIDR"
    type = string
  
}

variable "publicSubnet_cidr" {
    description = "Public Subnet CIDR"
    type = string
  
}

variable "publicSubnet_az" {
    description = "Availability Zone for Public Subnet"
    type = string
  
}

variable "priSubnet1_cidr" {
    description = "Private Subnet 1 CIDR"
    type = string
  
}

variable "priSubnet2_cidr" {
    description = "Private Subnet 2 CIDR"
    type = string
  
}

variable "priSubnet1_az" {
    description = "Availability Zone for Private Subnet 1"
    type = string
  
}

variable "priSubnet2_az" {
    description = "Availability Zone for Private Subnet 2"
    type = string
  
}

variable "isPrivateSubnetNeeded" {
    description = "Whether private subnet is needed or not"
    type = bool
  
}

variable "egress_rules" {
    description = "Egress rules for the security group"
    type = list(object({
        from_port = number
        to_port   = number
        protocol  = string
        cidr_blocks = list(string)
    }))
  
}

variable "ingress_rules" {
    description = "Ingress rules for the security group"
    type = list(object({
        from_port = number
        to_port   = number
        protocol  = string
        cidr_blocks = list(string)
    }))
  
}