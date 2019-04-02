resource "digitalocean_droplet" "centos-teste" {
    image = "centos-7-x64"
    name = "centos-teste"
    region = "fra1"
    size = "s-1vcpu-1gb"
    private_networking = true
    ssh_keys = [
      "${var.ssh_fingerprint}"
    ]
    connection {
        user = "root"
        type = "ssh"
        private_key = "${file(var.pvt_key)}"
        timeout = "2m"
    }
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
}
