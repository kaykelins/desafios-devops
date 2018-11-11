module "security_group" {
  source = "./security_group"
  ssh_client_ip_range = "${var.ssh_client_ip_range}"
  region = "${var.region}"
}

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region = "${var.region}"
}

resource "aws_instance" "aws-centos-apache" {
  
  ami           = "${data.aws_ami.centos.id}"
  instance_type = "t2.micro"
  monitoring = true
  key_name = "${aws_key_pair.id_rsa.id}"
  vpc_security_group_ids = ["${module.security_group.access}"]
  subnet_id = "${module.security_group.subnet}"
  associate_public_ip_address = true

  provisioner "remote-exec" {
    inline = [
      "curl -fsSL https://get.docker.com -o get-docker.sh",
      "sh get-docker.sh",
      "sudo systemctl start docker",
      "sudo systemctl enable dockker",
      "sudo docker run --restart=unless-stopped -d -p 80:8080 -p 443:8443 bitnami/apache:2.4-debian-9"
      ]
  connection {
    user = "centos"
    type = "ssh"
    private_key = "${file("${var.private_key}")}"
  }
  }
  tags {
    Name = "Centos_Apache"
  }
}
resource "aws_key_pair" "id_rsa" {
  key_name   = "id_rsa"
  public_key = "${var.ssh_public_key}"
}


output "public_ip" {
  value = "http://${aws_instance.aws-centos-apache.public_ip}"
}
