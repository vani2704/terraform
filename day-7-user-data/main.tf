resource "aws_instance" "vani" {
    ami = "ami-013168dc3850ef002"
    instance_type = "t2.micro"
    user_data = file("test.sh")
    key_name = "keth"
    
    tags = {
      Name ="user_data"
    }
  }
  
