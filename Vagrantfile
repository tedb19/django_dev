# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "django-webdev"
  config.vm.define "django_webdev" do |django_webdev|

  # running python manage.py runserver 0.0.0.0:8000 should enable you
  # check out the app on host at localhost:8000
  config.vm.network "forwarded_port", guest: 8000, host: 8010
  
  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.provider "virtualbox" do |vb|
      vb.name = "django_webdev"
      vb.memory = "1024" 
      vb.cpus = 2
      
      vb.customize ['modifyvm', :id, '--clipboard', 'bidirectional']
  end

  config.vm.provision "shell", path: "provision.sh"
end
end
