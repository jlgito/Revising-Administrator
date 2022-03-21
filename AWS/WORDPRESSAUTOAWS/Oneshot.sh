#!/bin/bash
#Lien de la documentation officeil pour beaucoups plus d'aide .

aws ec2 create-vpc --cidr-block 10.0.0.0/16 --query Vpc.VpcId --output text
aws ec2 create-subnet --vpc-id vpc-2f09a348 --cidr-block 10.0.1.0/24
aws ec2 create-subnet --vpc-id vpc-2f09a348 --cidr-block 10.0.0.0/24



aws ec2 create-internet-gateway --query InternetGateway.InternetGatewayId --output text
aws ec2 attach-internet-gateway --vpc-id vpc-2f09a348 --internet-gateway-id igw-1ff7a07b
aws ec2 create-route-table --vpc-id vpc-2f09a348 --query RouteTable.RouteTableId --output text
aws ec2 create-route --route-table-id rtb-c1c8faa6 --destination-cidr-block 0.0.0.0/0 --gateway-id igw-1ff7a07b

aws ec2 describe-route-tables --route-table-id rtb-c1c8faa6
aws ec2 associate-route-table  --subnet-id subnet-b46032ec --route-table-id rtb-c1c8faa6
aws ec2 modify-subnet-attribute --subnet-id subnet-b46032ec --map-public-ip-on-launch

#https://docs.aws.amazon.com/cli/latest/userguide/cli-services-ec2-sg.html

aws ec2 create-security-group --group-name my-sg --description "My security group" --vpc-id vpc-1a2b3c4d
aws ec2 authorize-security-group-ingress --group-id sg-903004f8 --protocol tcp --port 3389 --cidr x.x.x.x

#aws ec2 authorize-security-group-ingress --group-name my-sg --protocol tcp --port 3389 --cidr x.x.x.x


#https://docs.aws.amazon.com/cli/latest/userguide/cli-services-ec2-instances.html
#https://docs.aws.amazon.com/cli/latest/reference/opsworks/create-instance.html

aws opsworks --region us-east-1 create-instance --stack-id 935450cc-61e0-4b03-a3e0-160ac817d2bb --layer-ids 5c8c272a-f2d5-42e3-8245-5bf3927cb65b --hostname wordpress --instance-type m1.large --os "Amazon Linux"
aws opsworks --region us-east-1 create-instance --stack-id 935450cc-61e0-4b03-a3e0-160ac817d2bb --layer-ids 5c8c272a-f2d5-42e3-8245-5bf3927cb65b --hostname mariadb --instance-type m1.large --os "Amazon Linux"
