# gcc-6502 & Compiler Explorer

**WIP! - may not work yet.**

Prerequisites:

* Virtualbox
* Vagrant
* `vagrant plugin install vagrant-reload`
* `vagrant plug install vagrant-disksize`

This repo has submodules, and must be cloned recursively. Use the
`--recursive` flag when cloning:

    git clone --recursive https://github.com/tom-seddon/gcc-6502-compiler-explorer
	
Alternatively, clone normally and then set up the submodules manually:

    git submodule init
	git submodule update
	
The gcc repo is a bit of a beast, so you may be waiting a little while
either way.

# Installation steps

Get Vagrant to set up the VM, and SSH into it. From inside the working
copy:

    vagrant up
	vagrant ssh

Then from inside the VM, set everything up from the code in the repo
submodules:

    make -f /vagrant/provision/Makefile local
