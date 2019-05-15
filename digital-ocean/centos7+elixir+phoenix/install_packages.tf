    provisioner "remote-exec" {
        inline = [
          "sleep 25",
          "sudo yum update",
          "sudo yum install -y epel-release"
        ]
    }
    provisioner "remote-exec" {
        inline = [
          "sudo yum install -y curl vim wget git mariadb mariadb-server postgresql postgresql-server sqlite sudo screen"
        ]
    }
    provisioner "remote-exec" {
        inline = [
          "sudo yum install -y https://packages.erlang-solutions.com/erlang-solutions-1.0-1.noarch.rpm"
        ]
    }
    provisioner "remote-exec" {
        inline = [
          "sudo yum install -y wxBase.x86_64 gcc gcc-c++ glibc-devel make ncurses-devel openssl-devel autoconf java-1.8.0-openjdk-devel"
        ]
    }
    provisioner "remote-exec" {
        inline = [
	  "sudo yum install -y esl-erlang"
          "sudo mkdir /opt/elixir",
	  "sudo git clone https://github.com/elixir-lang/elixir.git /opt/elixir",
	  "sudo cd /opt/elixir && make && make install",
	  "sudo rm -f ~/.erlang.cookie",
	  "sudo mix local.hex --force && mix local.rebar --force",
	  "curl -sL https://rpm.nodesource.com/setup_11.x | sudo -E bash -",
	  "sudo yum install -y nodejs",
	  "sudo yum install -y inotify-tools",
	  "sudo mix archive.install --force hex phx_new 1.4.2",
	  "sudo yum update -y && sudo yum clean all"
        ]
    }
