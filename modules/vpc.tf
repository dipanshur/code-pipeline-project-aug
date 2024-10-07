resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr //argument
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name      = "${var.batchCode}-terraform-vpc"
    CreatedBy = var.CreatedBy
  }

}

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.publicSubnet_cidr //argument
  availability_zone = var.publicSubnet_az

  tags = {
    Name      = "${var.batchCode}-terraform-public-subnet"
    CreatedBy = var.CreatedBy
  }
}

resource "aws_subnet" "private1" {
  count = var.isPrivateSubnetNeeded == true ? 1 : 0

  vpc_id            = aws_vpc.this.id
  cidr_block        = var.priSubnet1_cidr //argument
  availability_zone = var.priSubnet1_az
  tags = {
    Name      = "${var.batchCode}-terraform-private-subnet1"
    CreatedBy = var.CreatedBy
  }
}

resource "aws_subnet" "private2" {

  count = var.isPrivateSubnetNeeded == true ? 1 : 0

  vpc_id            = aws_vpc.this.id
  cidr_block        = var.priSubnet2_cidr //argument
  availability_zone = var.priSubnet2_az

  tags = {
    Name      = "${var.batchCode}-terraform-private-subnet2"
    CreatedBy = var.CreatedBy
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Name      = "${var.batchCode}-terraform-public-RT"
    CreatedBy = var.CreatedBy
  }
}

resource "aws_route_table" "private" {
  count = var.isPrivateSubnetNeeded == true ? 1 : 0

  vpc_id = aws_vpc.this.id

  tags = {
    Name      = "${var.batchCode}-terraform-private-RT"
    CreatedBy = var.CreatedBy
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id

}

resource "aws_route_table_association" "private1" {
  
  count = var.isPrivateSubnetNeeded == true ? 1 : 0

  subnet_id      = aws_subnet.private1[count.index].id
  route_table_id = aws_route_table.private[count.index].id

}

resource "aws_route_table_association" "private2" {
  count = var.isPrivateSubnetNeeded == true ? 1 : 0

  subnet_id      = aws_subnet.private2[count.index].id
  route_table_id = aws_route_table.private[count.index].id

}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  
}

resource "aws_flow_log" "this" {
  vpc_id = aws_vpc.this.id
  log_destination = aws_s3_bucket.this.arn
  log_destination_type = "s3"
  traffic_type         = "ALL"
  log_format = "$${interface-id} $${srcaddr} $${dstaddr} $${srcport} $${dstport}"

  
}