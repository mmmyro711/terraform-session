#!/bin/bash
sudo dnf install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
sudo echo "Application Version 1 is running !" >> /var/www/html/index.html