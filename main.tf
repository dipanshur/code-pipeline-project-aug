module "july" {
    source = "./modules"

    isPrivateSubnetNeeded = true
    bucket_identifier = "test1"
    batchCode = "devOps-0830-July"
    typeofBatch = "weekday"
    vpc_cidr = "10.0.0.0/16"
    publicSubnet_az = "us-west-2a"
    publicSubnet_cidr = "10.0.0.0/20"
    priSubnet1_az = "us-west-2b"
    priSubnet1_cidr = "10.0.144.0/20"
    priSubnet2_az = "us-west-2c"
    priSubnet2_cidr = "10.0.160.0/20"
    CreatedBy = "Dipanshu"

    egress_rules = [
        {
            from_port = 0
            to_port   = 0
            protocol  = "-1"
            cidr_blocks = ["0.0.0.0/0"]

        }
    ]
    ingress_rules = [
        {
            from_port = 22
            to_port   = 22
            protocol  = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        },
        {
            from_port = 80
            to_port = 80
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
    ]
  
}

module "aug" {
    source = "./modules"
    isPrivateSubnetNeeded = false

    bucket_identifier = "test2"
    batchCode = "devOps-1100-Aug"
    typeofBatch = "weekend"
    vpc_cidr = "172.31.0.0/16"
    publicSubnet_az = "us-west-2a"
    publicSubnet_cidr = "172.31.0.0/20"
    priSubnet1_az = "us-west-2b"
    priSubnet1_cidr = "172.31.144.0/20"
    priSubnet2_az = "us-west-2c"
    priSubnet2_cidr = "172.31.160.0/20"
    CreatedBy = "Sachin"

    egress_rules = [
        {
            from_port = 0
            to_port   = 0
            protocol  = "-1"
            cidr_blocks = ["0.0.0.0/0"]

        }
    ]
    ingress_rules = [
        {
            from_port = 22
            to_port   = 22
            protocol  = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
    ]
  
}

# module "sep" {
#     source = "./modules"

#     bucket_identifier = "test2"
#     batchCode = "devOps-0900-Sep"
#     typeofBatch = "weekend"
#     vpc_cidr = "192.168.0.0/16"
#     publicSubnet_az = "us-west-2a"
#     publicSubnet_cidr = "192.168.0.0/20"
#     priSubnet1_az = "us-west-2b"
#     priSubnet1_cidr = "192.168.144.0/20"
#     priSubnet2_az = "us-west-2c"
#     priSubnet2_cidr = "192.168.160.0/20"
#     CreatedBy = "Nouman"
  
# }