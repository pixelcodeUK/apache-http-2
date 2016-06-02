Vagrant.configure(2) do |config|
  config.vm.box = "geerlingguy/ubuntu1604"
  config.vm.provision :shell, path: "setup.sh", privileged: false
  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :forwarded_port, guest: 443, host: 4433
end
