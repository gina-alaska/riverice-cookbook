#
# Cookbook Name:: riverice-cookbook
# Recipe:: ldm
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

group 'ldm' do
  gid 5114
  action :create
end

user 'ldm' do
  comment 'Sandy LDM'
  home '/opt/ldm'
  shell '/bin/bash'
  uid 7001
  gid 5114
  action :create
end

remote_file '/tmp/ldm-6.13.6.tar.gz' do
  source 'ftp://ftp.unidata.ucar.edu/pub/ldm/ldm-6.13.6.tar.gz'
  action :create_if_missing
end

execute 'extract' do
  cwd '/tmp'
  command 'tar xzvf ldm-6.13.6.tar.gz'
  not_if { ::File.directory?('/tmp/ldm-6.13.6') }
end

directory '/opt/ldm' do
  owner 'ldm'
  group 'ldm'
  mode '0755'
  action :create
end

bash 'build_ldm' do
  cwd '/tmp/ldm-6.13.6'
  code <<-EOH
    ./configure --prefix=/opt/ldm
    make install  
    EOH
  not_if { ::File.exists?('/opt/ldm/bin/newlog') }
end

file '/opt/ldm/var/queues/ldm.pq' do
  mode '0664'
  only_if { ::FileTest.exists?('/opt/ldm/var/queues/ldm.pq') }
end

group 'ldm' do
  append true
  members node['riverice']['user']
  #action :modify   # not sure why this was set to modify
  action :create
end
