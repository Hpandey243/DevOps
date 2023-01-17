# Output variables

output "instance_public_ip" {

    description = "Public IP of instance"
    value = aws_instance.EC2_Demo.public_ip
  
}

output "instance_public_dns" {

    description = "Public DNS of instance"
    value = aws_instance.EC2_Demo.public_dns
  
}



