
provider "aws"{
region = "ap-south-1"
}

export AWS_ACCESS_KEY_ID=${aws-credentials}
export AWS_SECRET_ACCESS_KEY=${aws-credentials}

resource "aws_instance" "AWSInstance" {
     count ="2"
     ami = "ami-04708942c263d8190"
	 instance_type = "t2.micro"
	 key_name = "devopskey"
	 security_groups = ["launch-wizard-1"]
	 tags = {
	 Name = "tomcatserver"
	 }
}





