    provisioner "remote-exec" {
        inline = [
          "sleep 25",
	  "echo 'Instalando Zabbix...'",
	  "sudo sed -i '7s/permissive/disabled/' /etc/selinux/config",
          "sudo sed -i '7s/enforcing/disabled/' /etc/selinux/config",
          "sudo yum install https://repo.zabbix.com/zabbix/4.2/rhel/7/x86_64/zabbix-release-4.2-1.el7.noarch.rpm",
	  "sudo yum clean all",
	  "sudo yum -y install zabbix-server-mysql zabbix-web-mysql zabbix-agent",
	  "sudo systemctl start mariadb",
	  "sudo systemctl enable mariadb",
	  "sudo mysql -u root -p -c 'create database zabbix character set utf8 collate utf8_bin;'",
	  "sudo zcat /usr/share/doc/zabbix-server-mysql*/create.sql.gz | mysql -uroot -p zabbix",
	  "sudo systemctl enable zabbix-server zabbix-agent httpd"
        ]
    }

