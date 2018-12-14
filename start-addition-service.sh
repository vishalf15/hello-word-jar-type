#!/bin/bash
cd '/home/ec2-user/apps/hello-word'
echo 'EC2 list before copying content from S3 to EC2 = '
ls

echo 'S3 list = '
aws s3 ls s3://pract-code-build/hello-word-jar-type/target

echo 'Starting copying jar from S3 bucket to EC2'
aws s3 cp s3://pract-code-build/hello-word-jar-type/target/hello-word-jar-type-1.0.0.jar hello-word-jar-type-1.0.0.jar
echo 'Jar copy completed from S3 bucket to EC2'

echo 'EC2 list After copying content from S3 to EC2 = '
ls

echo 'Starting Spring Boot app'
nohup java -jar hello-word-jar-type-1.0.0.jar > /dev/null &