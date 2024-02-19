resource "aws_vpc" "vpc_second" {
  cidr_block = "20.0.0.0/16"
  tags = {
    Name = "vpc_second"
  }
}

resource "aws_subnet" "sub_d" {
  vpc_id     = aws_vpc.vpc_second.id
  cidr_block = "20.0.192.0/18"

  tags = {
    Name = "sub_d"
  }
}

# resource "aws_subnet" "sub_a" {
#   vpc_id     = aws_vpc.vpc_second.id
#   cidr_block = "20.0.0.0/18"

#   tags = {
#     Name = "sub_a"
#   }
# }

# resource "aws_subnet" "sub_b" {
#   vpc_id     = aws_vpc.vpc_second.id
#   cidr_block = "20.0.64.0/18"

#   tags = {
#     Name = "sub_b"
#   }
# }

# resource "aws_subnet" "sub_c" {
#   vpc_id     = aws_vpc.vpc_second.id
#   cidr_block = "20.0.128.0/18"

#   tags = {
#     Name = "sub_c"
#   }
# }

# resource "aws_internet_gateway" "gw_second" {
#   vpc_id = aws_vpc.vpc_second.id

#   tags = {
#     Name = "gw_second"
#   }
# }

# resource "aws_route_table" "rt_second" {
#   vpc_id = aws_vpc.vpc_second.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.gw_second.id
#   }

#   tags = {
#     Name = "rt_second"
#   }
# }

# resource "aws_eip" "prvt_inst" {
#   domain   = "vpc"
# }

# resource "aws_nat_gateway" "nat_gtw_sub_c" {
#   allocation_id = aws_eip.prvt_inst.id
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

# resource "aws_route_table_association" "rt_assc_sub_a" {

#   subnet_id      = aws_subnet.sub_a.id
#   route_table_id = aws_route_table.rt_second.id

# }

# resource "aws_route_table_association" "rt_assc_sub_b" {

#   subnet_id      = aws_subnet.sub_b.id
#   route_table_id = aws_route_table.rt_second.id

# }

# resource "aws_route_table_association" "rt_assc_sub_c" {

#   subnet_id      = aws_subnet.sub_c.id
#   route_table_id = aws_route_table.rt_private.id

# }

# resource "aws_security_group" "sg_cde" {
#   # ... other configuration ...
#   name        = "sg_cde"
#   description = "Allow ssh inbound traffic"
#   vpc_id      = aws_vpc.vpc_second.id
  

#   tags = {
#     Name = "sg_abc"
#   }
#   ingress {
#     from_port        = 22
#     to_port          = 22
#     protocol         = "tcp"
#     cidr_blocks      = ["0.0.0.0/0"]
#   }
# }

# resource "aws_key_pair" "rev_terra_key" {
#   key_name   = "rev_terra_key"
#   public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC4thFWvbNk+4CwHlBPj2sN3PWQwi4b/DXTmvjXpGAZx1LUUW0LaZ0Cu+dnPqR0LGFMbTxgOHDioLK3LpntsWPPGcc7RhZFMxBCGRFrsO78N8K+5lMnlzIz2X/i3mgA+DLsPjFnDQG5k/4Eh+LXmHY6LvQ14Q3+beH4bJHn/vQyh0RkT91TCtDLPJljghpQyscb6GZ/VPlO1lUPvMz4hpi1/q0Ww9reMSgmaP8jG8Lunmyg3xywQIYnRf9a2MKAWw4NaNVgK/21fR2CW/y6DS/mJvXvt80YPQ9kD/yHVeUYwyZqQSJbf01DZ7vhCevMnScJYXv7+RdwwT1Pn3Q8afG1GZ/RETLeVQjDOhBpJv7521+aZko333TjhGrd5ogFj2k0C1H5EKIB1YLrpZJzdNCsMtBxdLi9GetkmiOMsTa0EbDOdxx19/loDs1I9kcqRSvH50Sz7w2ENHghFd3vnV2m7Q1sqTjmx2bP/iaGOCgHcSr5EB/SXo1nt/HK03r/XEZKc7BzZOWC/V+ZeX5woH8ouL3mfK2B32HvCiWrM/seeo8nwvMCE15zCTaRiwwHpRWtrJqvg3cnFFouSXHCfHDOjtpIDtI8Cf1HIQzXbaidona1oFKz4obh1RMP5W04alxgZsE0+QF0Kaa6Q2Gg8XPDm0jNO7z9MVhT3ufl4CpcCw== lakshmi@lakshmis-MBP"
# }


# data "aws_ami" "ubuntu" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   owners = ["099720109477"] # Canonical
# }

# resource "aws_instance" "inst_two" {
#   ami           = data.aws_ami.ubuntu.id
#   instance_type = "t3.micro"
#   subnet_id      = aws_subnet.sub_a.id
#   key_name = "rev_terra_key"
#   vpc_security_group_ids = [aws_security_group.sg_cde.id]
#   associate_public_ip_address = "true"

#   tags = {
#     Name = "Inst_two"
#   }
# }













