variable "aws_access_key" {
  description = "variavel preenchida por .tfvars"
}

variable "private_key" {
   description = "variavel preenchida por .tfvars"
}

variable "aws_secret_key" {
  description = "variavel preenchida por .tfvars"
}

variable "ssh_public_key" {
  description = "variavel preenchida por .tfvars" 
}


variable "region" {
  description = "Região desejada para instancia"
}


variable "ssh_client_ip_range" {
  description = "Ip range de acesso via ssh"  
}

data "aws_ami" "centos" {
  owners      = ["679593333241"]
  most_recent = true

  filter {
    name   = "name"
    values = ["CentOS Linux 7 x86_64 HVM EBS *"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}



