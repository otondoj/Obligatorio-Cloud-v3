##--INSTANCIA 1--##

#############################################################################
resource "aws_instance" "webserver_01" {
    ami             = var.ami
    instance_type   = var.instance_type
    key_name        = var.key_name
    subnet_id       = aws_subnet.subnet_1_obligatorio.id
    security_groups = [aws_security_group.security_group_obligatorio.id]
    user_data    = file("C:/Terraform/Obligatorio/webserver.sh")
    
    tags = {
      Name      = "Web Server 01"
      terraform = "True"
    }
  } 
#############################################################################
resource "aws_ami_from_instance" "example" {
  name               = "terraform-example"
  source_instance_id = aws_instance.webserver_01.id
}
#############################################################################