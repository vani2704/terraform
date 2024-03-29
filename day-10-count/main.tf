# variables.tf
variable "ami" {
  type    = string
  default = "ami-0ba259e664698cbfc"
  
  }

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

# main.tf
resource "aws_instance" "sandbox" {
  count         = 3
  ami           = var.ami
  instance_type = var.instance_type
  tags = {
    Name = "sandbox_count"
  }
}