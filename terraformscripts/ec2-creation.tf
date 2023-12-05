
provider "aws"{
region = "ap-south-1"
}

resource "aws_instance" "AWSInstance" {
     count ="2"
     ami = "ami-080e56c34f8367264"
	 instance_type = "t2.micro"
	 key_name = "devopskey"
	 security_groups = ["launch-wizard-1"]
	 tags = {
	 Name = "tomcatservers"
	 }
}





