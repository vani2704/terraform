# create vpc
resource "aws_vpc" "dev" {
    cidr_block = "10.0.0.0/16"
    tags={
        Name = "dev"
    }
  }
  #creating internet gateway and attach to vpc
  resource "aws_internet_gateway" "dev" {
    vpc_id = aws_vpc.dev.id
    
  }
  #creating subnets
  resource "aws_subnet" "dev" {
      cidr_block = "10.0.0.0/24"
      vpc_id = aws_vpc.dev.id
      availability_zone = "ap-south-1a"

   }
  #create route table and edit route and attach to internet gateway
  resource "aws_route_table" "dev" {
    vpc_id = aws_vpc.dev.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.dev.id
    }
  
  }
  #subnet association
  resource "aws_route_table_association" "dev" {
    route_table_id = aws_route_table.dev.id
    subnet_id = aws_subnet.dev.id
        
  }
  #launch ec2
  resource "aws_instance" "dev" {
    ami = "ami-0ba259e664698cbfc"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.dev.id
    key_name = "keth"
    availability_zone = "ap-south-1a"
    associate_public_ip_address = true
    vpc_security_group_ids =[aws_security_group.dev.id ]
    tags = {
      Name ="vani_instance"
    }
  }


# adding security group
locals { ports = [80,22,443] }

resource "aws_security_group" "dev" {
  vpc_id = aws_vpc.dev.id
  dynamic "ingress" {
    for_each = local.ports
    content {
        from_port = ingress.value
        to_port =   ingress.value
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
        from_port = 0
        to_port =   0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
  }
}