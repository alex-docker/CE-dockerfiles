#
# Cookbook Name:: softether
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "gcc" do
  action :install
end

package "make" do
  action :install
end


directory node['softether']['working_dir'] do
  action :create
end

bash 'make and install softether' do
  action :nothing
  flags '-ex'
  cwd node['softether']['working_dir']
  code <<-EOH
tar xzf #{node['softether']['arch_file']}
cd vpnserver
make i_read_and_agree_the_license_agreement
cd ..
mv ./vpnserver /usr/local/
EOH
end

remote_file ::File.join(node['softether']['working_dir'], node['softether']['arch_file']) do
  action :create_if_missing
  source node['softether']['site_url'] + node['softether']['arch_file']
  notifies :run, 'bash[make and install softether]', :immediately
end

template "init.d vpnserver" do
  path "/etc/init.d/vpnserver"
  source "vpnserver.erb"
  owner "root"
  group "root"
  mode 0755
end

service 'vpnserver' do
  action :enable
  action :start
end
