# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.ssh.shell="bash"
  config.ssh.forward_agent = true
  
  #config.ssh.username = "#{ENV['USERNAME']}"
  #config.ssh.private_key_path = ["~/.ssh/id_rsa","~/.vagrant.d/insecure_private_key"]
  #config.ssh.port = 22

  # proxy configuration
  PROXY = ENV['HTTP_PROXY'] ? ENV['HTTP_PROXY'] : ENV['http_proxy']
  if Vagrant.has_plugin?("vagrant-proxyconf") && PROXY
    config.proxy.http     = PROXY
    config.proxy.https    = PROXY
    config.proxy.no_proxy = "localhost,127.0.0.1"
  end

  config.vm.boot_timeout = 300

  config.vm.define "hyperv" do |hv|

    hv.vm.box = "centos/7"
	hv.vm.box_version = "1905.1"

    hv.vm.provider "hyperv" do |p|
      p.ip_address_timeout = 240
      p.vmname = "VagrantVM"
  	  p.memory = "4096"
      p.cpus = 1
  	end

  end

  config.vm.synced_folder '.', '/vagrant', nfs: true

  #config.vm.network "forwarded_port", guest: 22, host: 2222, host_ip: "127.0.0.1", id: 'ssh'
  
end