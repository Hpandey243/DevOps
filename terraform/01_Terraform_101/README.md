
# Terraform


#### What is Terraform?

Terraform is an infrastructure as code tool that lets you build, change, and version cloud and on-prem resources safely and efficiently.

Terraform can manage low-level components like compute, storage, and networking resources, as well as high-level components like DNS entries and SaaS features.



### How does Terraform work?

Terraform creates and manages resources on cloud platforms and other services through their APIs.

![App Screenshot](https://developer.hashicorp.com/_next/image?url=https%3A%2F%2Fcontent.hashicorp.com%2Fapi%2Fassets%3Fproduct%3Dterraform%26version%3Drefs%252Fheads%252Fv1.3%26asset%3Dwebsite%252Fimg%252Fdocs%252Fintro-terraform-apis.png%26width%3D2048%26height%3D644&w=3840&q=75)



## Description
In this project, we will launch an EC2 instance of type t3.micro of given  ami taken from the AWS account and run the user scripts into that instance using  terraform.


## Prerequisite


- Active AWS account with user configured in local machine.
- Terraform installed locally.


### Introduction


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
- Terraform relies on plugins called providers to interact with cloud providers.Terraform configurations must declare which providers they require so that Terraform can install and use them.
#### Provider Block
```#### Provider Block
provider "aws" {
  region = "us-east-1"    # specifying aws region 
}
```


    

