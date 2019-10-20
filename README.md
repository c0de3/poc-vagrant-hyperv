# SlothMotion's POC for setting up a Hyper-V VM with Vagrant

#### Steps:
* the Vagrantfile defines a Hyper-V provider which pulls the image configured with hv.vm.box and hv.vm.box_version
(box name and version [1])
* for running the VM, execute the following:
	```
	vagrant up hyperv
	```
* at the first execution image is downloaded and you will be prompted for selecting a virtual switch,
select the 'Default Switch' option (customly created switches cannot be used, because of some limitation [2],
issue has already created on GitHub [3]):
	```
	hyperv: Please choose a switch to attach to your Hyper-V instance.
	hyperv: If none of these are appropriate, please open the Hyper-V manager
	hyperv: to create a new virtual switch.
	hyperv:
	hyperv: 1) nat
	hyperv: 2) DockerNAT
	hyperv: 3) Default Switch
	hyperv:
	```
* after VM is configured and it runs, you can ssh into it:
	```
	vagrant ssh
	```
* VM can be shut down with:
	```
	vagrant halt
	```
* for destroying VM and removing resources (image will remains in vagrant cache folder):
	```
	vagrant destroy
	```
* if there is an issue log level can be configured with the env var:
	```
	export VAGRANT_LOG=debug
	```

---
[1] https://app.vagrantup.com/boxes/search

[2] https://www.vagrantup.com/docs/hyperv/limitations.html#limited-networking

[3] https://github.com/hashicorp/vagrant/issues/10385
