resource "aws_instance" "dev" {
    ami = "ami-0ba259e664698cbfc"
    instance_type = "t2.micro"
    
    tags = {
      Name ="vani_depends-on"
    }
  }

  #creating s3 bucket
  resource "aws_s3_bucket" "vani" {
    bucket = "bhavik-son"
    depends_on = [ aws_instance.dev ]
    
  }