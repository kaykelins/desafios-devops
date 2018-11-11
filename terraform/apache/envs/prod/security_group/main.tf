
resource "aws_vpc" "default" {
  cidr_block = "${var.subnet_ips}"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags {
    name = "prod-venv"
  }
}

resource "aws_subnet" "mainsubnet" {
  vpc_id     = "${aws_vpc.default.id}"
  cidr_block = "${cidrsubnet(aws_vpc.default.cidr_block, 3, 1)}"
  tags {
    Name = "Mainsubnet"
  }
}

resource "aws_internet_gateway" "simplegateway" {
  vpc_id = "${aws_vpc.default.id}"

  tags {
    Name = "VPC internet gateway"
  }
}

resource "aws_route_table" "access-public" {
  vpc_id = "${aws_vpc.default.id}"

  route {
    cidr_block = "${var.allow_all}"
    gateway_id = "${aws_internet_gateway.simplegateway.id}"
  }

  tags {
    Name = "Public Subnet"
  }
}
# Assign the route table to the public Subnet
resource "aws_route_table_association" "access-public" {
  subnet_id = "${aws_subnet.mainsubnet.id}"
  route_table_id = "${aws_route_table.access-public.id}"
}

resource "aws_default_security_group" "default" {
  
  vpc_id = "${aws_vpc.default.id}"
  
  tags {
    Name = "access security group"
  }
  
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["${var.allow_all}"]
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["${var.allow_all}"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["${var.ssh_client_ip_range}"]
  }
  
  egress {
   from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }
}
output "access" {
  value = "${aws_default_security_group.default.id}"
}
output "subnet" {
  value = "${aws_subnet.mainsubnet.id}"
}

