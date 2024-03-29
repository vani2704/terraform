#copy and paste existing security group id from day-2 custom vpc
data "aws_security_group" "dev" {
    id ="sg-04a04be526fcb0394"
  
}

#copy nd paste existing subnet id from day-2 custom vpc
data "aws_subnet" "dev" {
    id ="subnet-0e01626dfa96865dd"
  
}

#adding data filter to know the ami id
data "aws_ami" "vani" {
  most_recent = true
  owners = [ "self" ]

  filter {
    name   = "name"
    values = ["vani-ami"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
