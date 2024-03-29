# varriable.tf
  variable "ami" {
    type = string
    default = "ami-0ba259e664698cbfc"
  }

  variable "instance_type" {
    type = string
    default = "t2.micro"
    
  }

  variable "sandboxes" {
  type    = list(string)
  default = ["dev","test","prod"]
}

# main.tf
resource "aws_instance" "sandbox" {
  ami           = var.ami
  instance_type = var.instance_type
  count         = 3
  tags = {
    Name = var.sandboxes[count.index]
  }
}
    
 
 
