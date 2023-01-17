# Input variables

# AWS- REGION

variable "aws_region" {

    description = "AWS region name "
    type = string
    default = "us-east-1"
}

# AWS instance type

variable "aws_instance" {
    description = "value"
    type = string
    default = "t3.micro"

}

variable "instance_keypair" {
    description = "key pair associcated with  the EC2 instance"
    type = string
    default = "terraform-key"

}