resource "aws_instance" "web" {
  ami           = var.ami-id
  instance_type = "t2.micro"

  tags = {
    Name   = "LinuxVM"
    region = "ap-south-1"
  }
}

resource "aws_s3_bucket" "example-bucket-21" {
  bucket = "rohan-bucket-s3-first"
}

resource "aws_s3_bucket_acl" "example-acl-rohan-s3" {
  bucket = aws_s3_bucket.example-bucket-21.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.example-bucket-21.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_vpc" "vpc-tf" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "VPC-FROM-TF"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.vpc-tf.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "subnet-from-tf"
  }
}

resource "aws_db_instance" "rohan" {
  allocated_storage    = 10
  db_name              = var.my-db-name
  engine               = var.my-db-engine
  engine_version       = var.my-db-engine-number
  instance_class       = "db.t3.micro"
  username             = var.my-db-user
  password             = var.my-db-pwd
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}
