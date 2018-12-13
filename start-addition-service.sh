#!/bin/bash
cd '/home/ec2-user/apps/hello-word'
echo 'EC2 list before copying content from S3 to EC2 = '
ls

echo 'S3 list = '
aws s3 ls s3://pract-code-deploy

echo 'Starting copying jar from S3 bucket to EC2'
aws deploy push --application-name hello-word-jar-type --s3-location s3://pract-code-deploy/hello-word-jar-type-1.0.0.jar --ignore-hidden-files
echo 'Jar copy completed from S3 bucket to EC2'

echo 'EC2 list After copying content from S3 to EC2 = '
ls

echo 'Starting Spring Boot app'
nohup java -jar hello-word-jar-type-1.0.0.jar > /dev/null &