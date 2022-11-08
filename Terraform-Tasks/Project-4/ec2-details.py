import boto3

ec2 = boto3.client('ec2','us-east-1')
instance_details= ec2.describe_instances()

print(instance_details)
