resource "aws_instance" "vani" {
    ami = "ami-013168dc3850ef002"
    instance_type = "t2.micro"
    availability_zone = "ap-south-1a"
    key_name = "keth"

tags = {
    Name = "life cycle"
}

lifecycle {

    //create_before_destroy = true    #this attribute will create the new object first and then destroy the old one
    //prevent_destroy = true    #Terraform will error when it attempts to destroy a resource when this is set to true:
    //ignore_changes = [tags,] #This means that Terraform will never update the object but will be able to create or destroy it.

  }

}