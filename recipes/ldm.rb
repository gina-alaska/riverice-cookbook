#
# Cookbook Name:: riverice-cookbook
# Recipe:: ldm
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

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

file '/opt/ldm/var/queues/ldm.pq' do
  mode '0664'
  only_if { ::FileTest.exists?('/opt/ldm/var/queues/ldm.pq') }
end
