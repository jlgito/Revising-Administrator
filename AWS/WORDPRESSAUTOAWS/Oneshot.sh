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

