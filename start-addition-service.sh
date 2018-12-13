#!/bin/bash
echo 'S3 list = '
aws s3 ls s3://pract-code-deploy

echo 'Starting copying jar from S3 bucket to EC2'
aws deploy push --application-name hello-word-jar-type --s3-location s3://pract-code-deploy/hello-word-jar-type-1.0.0.jar --ignore-hidden-files
echo 'Jar copy completed from S3 bucket to EC2'

cd '/home/ec2-user/apps/addition-service'
echo 'EC2 list = '
ls
echo 'Starting Spring Boot app'
nohup java -jar addition-service-1.0.0.jar > /dev/null &