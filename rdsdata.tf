provider "aws" {
region = "ap-south-1"
profile = "default"
}
resource "aws_security_group" "rds" {
name        = "mysql-rds"
ingress {
description = "Allow All"
from_port   = 0
to_port     = 0
protocol    = "-1"
cidr_blocks = ["0.0.0.0/0"]
}
egress {
from_port   = 0
to_port     = 0
protocol    = "-1"
cidr_blocks = ["0.0.0.0/0"]
}
tags = {
Name = "myrds"
}
}
resource "aws_db_instance" "risdb" {
allocated_storage    = 20
identifier           = "task6instance"
storage_type         = "gp2"
engine               = "mysql"
engine_version       = "5.7.30"
instance_class       = "db.t2.micro"
name                 = "risdb"
username             = "rishabh"
password             = "qwerty"
iam_database_authentication_enabled = true
parameter_group_name = "default.mysql5.7"
skip_final_snapshot  = true
publicly_accessible = true
tags = {
Name = "sqldb"
}
}
