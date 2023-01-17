
# Terraform


#### What is Terraform?

Terraform is an infrastructure as code tool that lets you build, change, and version cloud and on-prem resources safely and efficiently.

Terraform can manage low-level components like compute, storage, and networking resources, as well as high-level components like DNS entries and SaaS features.



### How does Terraform work?

Terraform creates and manages resources on cloud platforms and other services through their APIs.

![Terraform ](https://developer.hashicorp.com/_next/image?url=https%3A%2F%2Fcontent.hashicorp.com%2Fapi%2Fassets%3Fproduct%3Dterraform%26version%3Drefs%252Fheads%252Fv1.3%26asset%3Dwebsite%252Fimg%252Fdocs%252Fintro-terraform-apis.png%26width%3D2048%26height%3D644&w=3840&q=75)



## Description
In this project, we will launch an EC2 instance of type t3.micro of given  ami taken from the AWS account and run the user scripts into that instance using  terraform.


## Prerequisite


- Active AWS account with user configured in local machine.
- Terraform installed locally.



 #### Step 1.    Create c1-versions. tf  file. 
   
 - This file contains the terraform related settings. The special terraform configuration block type is used to configure some behaviors of Terraform itself, such as requiring a minimum Terraform version to apply your configuration.
     
     
#### Terraform Block  
```
       
        terraform {
          required_version = ">= 1.0" # which means any version equal & above 1.0 like 1.1, 1.2 etc
          required_providers {     # we are using tf to interact with  aws cloud using aws provider.
            aws = {
              source = "hashicorp/aws"
              version = "~> 3.0"
            }
          } 
        } 
``` 
- Terraform relies on plugins called providers to interact with cloud providers.Terraform configurations must declare which providers they require so that Terraform can install and use them. Every resource type is implemented by a provider, without providers, Terraform can't manage any kind of infrastructure.
#### Provider Block
```#### Provider Block
provider "aws" {
  region = "us-east-1"    # specifying aws region 
}
```

#### Step 2.    Create a resource block in  ec2- instance. tf  file. 
   
 - This file contains the deatils of the resource that we are creating in this project  (EC2 instance ) . It has details like  ami, type of instance, tags for the instance, user scripts that will be executed once the instance spins up. Here user_data refers to the file which has command to install server and create an HTML page.
     
     

```
     # Resource: EC2 Instance
        resource "aws_instance" "myec2vm" {
          ami = "ami-0742b4e673072066f"
          instance_type = "t3.micro"
          user_data = file("app1-install.sh")
          tags = {
            "Name" = "EC2 Demo"
          }
        }
``` 
- The   "Name - EC2 Demo"  is the tag that gets attached to the EC instance and it gets assigned to default VPC and the security group.


#### Step 3.   Create app1 - install . sh file.
- This file contais the bash script which gets executed to the linux instance of mentioned details. It installs  and starts http server on linux instance  and  creates var/www/html/index.html  file . This file is served on the serever which is reachable through the public ip  of instance on browser.
```
#!/bin/bash 
sudo yum update -y
sudo yum install -y httpd
sudo systemctl enable httpd
sudo service httpd start  
sudo echo '<h1>Welcome to EC2  - APP</h1>' | sudo tee /var/www/html/index.html
```


## How does Terraform work?
The core Terraform workflow consists of three stages:

- Write: We define resources, which may be across  cloud providers. Here we have written tf file to define how and Ec2 instance should be created in AWS.

- Plan: Terraform creates an execution plan describing the infrastructure it will create, update, or destroy based on the existing infrastructure and your configuration.

- Apply: On approval, Terraform performs the proposed operations in the correct order.

![Terraform ](https://developer.hashicorp.com/_next/image?url=https%3A%2F%2Fcontent.hashicorp.com%2Fapi%2Fassets%3Fproduct%3Dterraform%26version%3Drefs%252Fheads%252Fv1.3%26asset%3Dwebsite%252Fimg%252Fdocs%252Fintro-terraform-workflow.png%26width%3D2038%26height%3D1773&w=3840&q=75)

#### Now we are ready with our terraform files and can execute  terraform commands.

``` 
terraform init
``` 
<img width="980" alt="image" src="https://user-images.githubusercontent.com/42787064/212944165-ac55a4d2-67ea-4fee-a6a8-538eb80f331f.png">


- It Initialises Local Backend, Downloads the provider plugins.


- Creates  the folder structure ".terraform folder"



```
terraform plan
```
<img width="1252" alt="image" src="https://user-images.githubusercontent.com/42787064/212944866-0057cc35-a9d8-4f32-bdbd-2563e05f1c59.png">

- Displays the plan of resources to be created like  AMI ID picked, type of insatnce,  number of resources to be  created.

```
terraform apply  

or 

terraform apply -auto-approve
```
<img width="1125" alt="image" src="https://user-images.githubusercontent.com/42787064/212945448-2b0eb4e1-c9bc-436f-9fd2-fd2ea405a6b4.png">

- It creates  resources on aws, creates  terraform.tfstate file. 


### Verify

- The  ami id and type of insatnce created on AWS console Ec2 service.
- Tags added to instance.
- Check the public ip of instance and paste it on browser. The user data scripts gets executed and the idex.html page is reachable via public ip.



