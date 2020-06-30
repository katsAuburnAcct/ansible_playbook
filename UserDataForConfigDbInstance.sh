#!/usr/bin/bash

# Install packages
yum -y update
yum install -y emacs-nox nano tree python3
amazon-linux-extras install -y java-openjdk11
yum install -y java-11-openjdk-devel
yum install -y git

yum install -y gcc # needed by boto3 & psycopg2
yum install -y python3-devel
yum install -y postgresql-devel
yum install -y postgresql

yum install -y boto3
yum install -y flask
yum install -y uwsgi

# Configure/install custom software
#cd /home/ec2-user
#git clone https://github.com/katsAuburnAcct/python-image-gallery.git
#chown -R ec2-user:ec2-user python-image-gallery
#su ec2-user -c "cd ~/python-image-gallery && pip3 install -r requirements.txt --user"

su ec2-user -c "pip3 install --user boto3"
su ec2-user -c "pip3 install --user psycopg2"


# Start/enable services
systemctl stop postfix
systemctl disable postfix