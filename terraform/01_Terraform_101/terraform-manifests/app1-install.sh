#!/bin/bash 
sudo yum update -y
sudo yum install -y httpd
sudo systemctl enable httpd
sudo service httpd start  
sudo echo '<h1>Welcome to EC2  - APP</h1>' | sudo tee /var/www/html/index.html
