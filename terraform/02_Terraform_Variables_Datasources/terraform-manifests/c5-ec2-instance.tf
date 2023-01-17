# Resource: EC2 Instance

resource "aws_instance" "EC2_Demo" {
  ami = data.aws_ami.amznlinux.id
  instance_type = var.aws_instance
  user_data = file("app1-install.sh")
  vpc_security_group_ids = [ aws_security_group.vpc-ssh.id , aws_security_group.vpc-web.id]
  tags = {
    "Name" = "EC2 Demo"
  }
}