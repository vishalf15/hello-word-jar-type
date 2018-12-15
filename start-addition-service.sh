#!/bin/bash
cd '/home/ec2-user/apps/hello-word'

echo 'Starting copying jar from S3 bucket to EC2'
aws s3 cp s3://pract-code-build/hello-word-jar-type/hello-word-jar-type.zip hello-word-jar-type.zip
echo 'Jar copy completed from S3 bucket to EC2'

echo 'Unzipping copied file'
unzip hello-word-jar-type.zip

echo 'Unzipping completed'
echo 'List of files'
pwd
ls

echo 'Starting Spring Boot app'
sudo ln -s /home/ec2-user/apps/hello-word/hello-word-jar-type-1.0.0.jar /etc/init.d/helloWord
chmod 755 hello-word-jar-type-1.0.0.jar
sudo service helloWord start