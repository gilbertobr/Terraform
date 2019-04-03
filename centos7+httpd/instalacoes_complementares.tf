    provisioner "remote-exec" {
        inline = [
          "sleep 25",
          "sudo yum update",
          "sudo yum install httpd -y"
        ]
    }
    provisioner "remote-exec" {
        inline = [
          "sudo service httpd restart"
        ]
    }

