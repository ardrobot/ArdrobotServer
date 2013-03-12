template "sources.list" do
  path "/etc/apt/sources.list"
  source "sources.list.erb"
  mode 0644
  backup false
end

execute "mkdir /home/vagrant/.vnc/" do
  user "vagrant"
  group "vagrant"
  ignore_failure true
  not_if { ::File.exists?("/home/vagrant/.vnc/passwd") }
end


template "vncpasswd" do
  user "vagrant"
  group "vagrant"
  path "/home/vagrant/.vnc/passwd"
  source "vncpasswd.erb"
  mode 0600
  backup false
end

template "xstartup" do
  user "vagrant"
  group "vagrant"
  path "/home/vagrant/.vnc/xstartup"
  source "xstartup.erb"
  mode 0755
  backup false
end

execute "mkdir /etc/xinetd.d" do
  user "root"
  ignore_failure true
  not_if { ::File.exists?("/etc/xinetd.d/Xvnc") }
end

template "xvnc" do
  path "/etc/xinetd.d/Xvnc"
  source "xvnc.erb"
  mode 0644
  backup false
end



