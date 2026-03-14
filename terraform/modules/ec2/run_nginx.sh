#!/bin/bash

# Update & install nginx using dnf (Amazon Linux 2023)
sudo dnf update -y
sudo dnf install -y nginx

# Update and enable nginx
sudo systemctl enable nginx
sudo systemctl start nginx
