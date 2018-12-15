#!/bin/bash
cd '/home/ec2-user/apps/hello-word'
echo 'EC2 list before copying content from S3 to EC2 = '
ls

aws s3 ls s3://pract-code-build/hello-word-jar-type/

echo 'Starting copying jar from S3 bucket to EC2'
aws s3 cp s3://pract-code-build/hello-word-jar-type/hello-word-jar-type.zip hello-word-jar-type.zip
echo 'Jar copy completed from S3 bucket to EC2'

echo 'Unzipping copied file'
unzip hello-word-jar-type.zip

echo 'Unzipping completed'
cd target
mv hello-word-jar-type-1.0.0.jar ../

echo 'List of files'
pwd
ls

echo 'Starting Spring Boot app'
sudo ln -s /path/to/hello-word-jar-type-1.0.0.jar /etc/init.d/hello-word-jar-type
sudo service hello-word-jar-type start