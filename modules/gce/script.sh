#!/bin/sh

sudo google_metadata_script_runner --script-type startup
sudo apt update -y; sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
sudo apt install nginx -y
sudo ufw allow 'Nginx HTTP'