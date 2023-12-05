
provider "aws"{
region = "ap-south-1"
}

resource "aws_instance" "AWSInstance" {
     count ="2"
     ami = "ami-04708942c263d8190"
     instance_type = "t2.micro"
     key_name = "devopskey"
     security_groups = ["launch-wizard-1"]
     tags = {
      Name = "tomcatservers"
}
}





