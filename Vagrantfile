require "shellwords"

Vagrant.configure("2") do |x|
  x.vm.box="ubuntu/xenial64"
  x.ssh.forward_x11=true
  x.ssh.forward_agent=true
  x.disksize.size="40GB"

  x.vm.provider :virtualbox do |x|
    host=RbConfig::CONFIG['host_os']
    if host=~/darwin/
      ncpus=`sysctl -n hw.physicalcpu`.to_i
      nmbytes=`sysctl -n hw.memsize`.to_i/1024/1024
    elsif host=~/linux/
      ncpus=`cat /proc/cpuinfo | grep 'core id' | sort | uniq | wc -l`.to_i
      nmbytes=`grep 'MemTotal' /proc/meminfo | sed -e 's/MemTotal://' -e 's/ kB//'`.to_i/1024
    else
      # ??
      cpus=0
      nmbytes=0
    end
    x.customize ["modifyvm",:id,"--memory",[8192,nmbytes/4].minmax[1]]
    x.customize ["modifyvm",:id,"--cpus",ncpus]
  end

  x.vm.network "private_network",type:"dhcp"

  x.vm.provision "shell",privileged:true,inline:"/vagrant/provision/add_swapfile.sh"
  x.vm.provision "shell",privileged:true,inline:"/vagrant/provision/update_ubuntu.sh"
  x.vm.provision :reload
  x.vm.provision "shell",privileged:true,inline:"/vagrant/provision/provision.sh"
  x.vm.provision :reload
end
