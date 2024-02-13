resource "aws_vpc" "vpc_second" {
  cidr_block = "20.0.0.0/16"
  tags = {
    Name = "vpc_second"
  }
}

resource "aws_subnet" "sub_a" {
  vpc_id     = aws_vpc.vpc_second.id
  cidr_block = "20.0.0.0/18"

  tags = {
    Name = "sub_a"
  }
}

resource "aws_subnet" "sub_b" {
  vpc_id     = aws_vpc.vpc_second.id
  cidr_block = "20.0.64.0/18"

  tags = {
    Name = "sub_b"
  }
}

resource "aws_subnet" "sub_c" {
  vpc_id     = aws_vpc.vpc_second.id
  cidr_block = "20.0.128.0/18"

  tags = {
    Name = "sub_c"
  }
}

resource "aws_internet_gateway" "gw_second" {
  vpc_id = aws_vpc.vpc_second.id

  tags = {
    Name = "gw_second"
  }
}

resource "aws_route_table" "rt_second" {
  vpc_id = aws_vpc.vpc_second.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw_second.id
  }

  tags = {
    Name = "rt_second"
  }
}

# resource "aws_nat_gateway" "nat_gtw_sub_c" {
#   allocation_id = aws_eip.nat_gtw_sub_c.id
#   subnet_id     = aws_subnet.sub_a.id

#   tags = {
#     Name = "nat_gtw_sub_c"
#   }

# }

# resource "aws_route_table" "rt_private" {
#   vpc_id = aws_vpc.vpc_second.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     nat_gateway_id = aws_nat_gateway.nat_gtw_sub_c.id
#   }

#   tags = {
#     Name = "rt_private"
#   }
# }

resource "aws_route_table_association" "rt_assc_sub_a" {

  subnet_id      = aws_subnet.sub_a.id
  route_table_id = aws_route_table.rt_second.id

}

resource "aws_route_table_association" "rt_assc_sub_b" {

  subnet_id      = aws_subnet.sub_b.id
  route_table_id = aws_route_table.rt_second.id

}

# resource "aws_route_table_association" "rt_assc_sub_c" {

#   subnet_id      = aws_subnet.sub_c.id
#   route_table_id = aws_route_table.rt_private.id

# }


data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "inst_two" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name = "Inst_two"
  }
}









