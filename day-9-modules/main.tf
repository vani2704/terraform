module "dev" {

    source = "../day-9-modules.tf"
    ami_id = "ami-0ba259e664698cbfc"
    instance_type = "t2.micro"
    key_name = "keth"

  
}