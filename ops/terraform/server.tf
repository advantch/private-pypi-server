
resource "digitalocean_droplet" "pypiserver" {
  image = "docker-20-04"
  name = "pypiserver"
  region = "ams3"
  size = "s-1vcpu-1gb"
  private_networking = true
  ssh_keys = [
    data.digitalocean_ssh_key.terraform.id
  ]
  connection {
    host = self.ipv4_address
    user = "root"
    type = "ssh"
    private_key = file(var.pvt_key)
    timeout = "2m"
  }
  provisioner "remote-exec" {
    inline = [
      # USING PROVISIONER IS NOT RECOMMENDED
      "export PATH=$PATH:/usr/bin",
      "sudo apt-get update",
      "sudo apt install git",
      "git clone https://github.com/advantch/private-pypi-server",
      "cd private-pypi-server && docker-compose up -d --build",
      "docker container ls",

      "sudo ufw allow 80",
      "curl ifconfig.me"
    ]
  }
}