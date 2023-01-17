#!/bin/bash 
sudo yum update -y
sudo yum install -y httpd
sudo systemctl enable httpd
sudo service httpd start  
sudo echo '<h1>Welcome to EC2  - APP</h1>' | sudo tee /var/www/html/index.html
sudo mkdir /var/www/html/app1
sudo echo '<!DOCTYPE html> <html> <body> <h1> <p>Terraform Demo</p></h1>  </body></html>' | sudo tee /var/www/html/app1/index.html
