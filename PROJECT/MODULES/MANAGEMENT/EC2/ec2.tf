resource "aws_instance" "jenkins" {
  count                     = 1
  ami                       = "ami-0503db1a235b15e3f"
  instance_type             = "t2.small"
  subnet_id                 = "${element(var.MANAGEMENT_SUBNET_IDS, count.index)}"
  vpc_security_group_ids    = ["${aws_security_group.default-ssh.id}", "${aws_security_group.default-jenkins.id}"]

  provisioner "remote-exec" {
    connection {
      type                  = "ssh"
      user                  = "centos"
      private_key           = "${file("/home/centos/.ssh/id_rsa")}"
      host                  = "${element(aws_instance.jenkins.*.public_ip,count.index)}"
    }
    inline = [
      "sudo yum install ansible git -y",
      "ansible-pull -U https://Teja-Pagala:Tejeshwar@123github.com/Tejpagala/ansible-pull.git jenkins.yml",
    ]
  }

  tags = {
    Name                    = "${var.PROJECT_NAME}-${var.ENVIRONMENT}-Jenkins"
    ENVIRONMENT             = "${var.ENVIRONMENT}"
    PROJECT_NAME            = "${var.PROJECT_NAME}"
    MODULE_NAME             = "${var.MODULE_NAME}"
    CREATED_BY              = "TERRAFORM"
    MODIFIED_ON             = "${timestamp()}"
  }
}

