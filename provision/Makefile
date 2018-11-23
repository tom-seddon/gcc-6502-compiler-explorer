# -*- mode:makefile; -*-

.PHONY:default
default:
	$(error Specify target)

.PHONY:local
local: build_cc65 clone_gcc_local build_gcc

.PHONY:build_cc65
build_cc65:
	-rm -Rf ~/cc65
	cd ~ && git clone https://github.com/cc65/cc65
	cd ~/cc65 && make -j$(shell nproc)
	cd ~/cc65 && sudo make install PREFIX=/usr

.PHONY:clone_local
clone_gcc_local:
	-rm -Rf ~/gcc-6502-bits
	cp -R /vagrant/submodules/gcc-6502-bits/ ~

.PHONY:build_gcc
build_gcc:
	cd ~/gcc-6502-bits && ./build.sh 2>&1 | tee build.log
