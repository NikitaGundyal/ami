# ami
AWS AMI for CSYE-6225

Packer

Build Status Windows Build Status GoDoc GoReportCard

    Website: https://www.packer.io
    IRC: #packer-tool on Freenode
    Mailing list: Google Groups

Packer is a tool for building identical machine images for multiple platforms from a single source configuration.

Packer is lightweight, runs on every major operating system, and is highly performant, creating machine images for multiple platforms in parallel. Packer comes out of the box with support for many platforms, the full list of which can be found at https://www.packer.io/docs/builders/index.html.


First, download a pre-built Packer binary for your operating system or compile Packer yourself.

After Packer is installed, create your first template, which tells Packer what platforms to build images for and how you want to build them. In our case, we'll create a simple AMI that has Redis pre-installed. Save this file as quick-start.json. Export your AWS credentials as the AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY environment variables.

{
  "variables": {
    "access_key": "{{env `AWS_ACCESS_KEY_ID`}}",
    "secret_key": "{{env `AWS_SECRET_ACCESS_KEY`}}"
  },
  "builders": [{
    "type": "amazon-ebs",
    "access_key": "{{user `access_key`}}",
    "secret_key": "{{user `secret_key`}}",
    "region": "us-east-1",
    "source_ami": "ami-af22d9b9",
    "instance_type": "t2.micro",
    "ssh_username": "ubuntu",
    "ami_name": "packer-example {{timestamp}}"
  }]
}

Next, tell Packer to build the image:

$ packer build quick-start.json
...

Packer will build an AMI according to the "quick-start" template. The AMI will be available in your AWS account. To delete the AMI, you must manually delete it using the AWS console. Packer builds your images, it does not manage their lifecycle. Where they go, how they're run, etc., is up to you.
Documentation

Comprehensive documentation is viewable on the Packer website:

https://www.packer.io/docs

####

Pre-requisite
Packer should be downloaded

Validate Template
packer validate ami.json

Build AMI

packer build \
-var "aws_access_key=${aws_access_key}" \
-var "aws_secret_key=${aws_secret_key}" \
-var "aws_region=${AWS_REGION}" \
-var "account_ids=${account_ids}" \
-var "source_ami=${source_ami}" \
ami.json