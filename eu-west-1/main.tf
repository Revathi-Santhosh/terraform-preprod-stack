
resource "aws_vpc" "vpc_first" {
  cidr_block = "19.0.0.0/16"
  tags = {
    Name = "vpc_first"
  }
}

resource "aws_subnet" "first_sub" {
  vpc_id     = aws_vpc.vpc_first.id
  cidr_block = "19.0.0.0/18"

  tags = {
    Name = "sub_ab"
  }
}

resource "aws_subnet" "second_sub" {
  vpc_id     = aws_vpc.vpc_first.id
  cidr_block = "19.0.128.0/18"

  tags = {
    Name = "second_sub"
  }
}

resource "aws_security_group" "sg_abc" {
  # ... other configuration ...
  name        = "sg_abc"
  description = "Allow ssh inbound traffic"
  vpc_id      = aws_vpc.vpc_first.id

  tags = {
    Name = "sg_abc"
  }
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}






