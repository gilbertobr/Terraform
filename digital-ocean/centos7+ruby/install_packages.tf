    provisioner "remote-exec" {
        inline = [
          "echo 'Adicionando Usuário'",
          "sudo adduser deploy"
        ]
    }
    provisioner "remote-exec" {
        inline = [
          "sleep 25",
	  "echo 'Instalando Ruby...'",
          "sudo gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB",
          "sudo gpg2 --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB",
	  "curl -sSL https://get.rvm.io | sudo bash -s stable --rails",
	  "source /etc/profile.d/rvm.sh",
	  "sudo rvm install 2.3.7"
        ]
    }

