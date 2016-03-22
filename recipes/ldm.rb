#
# Cookbook Name:: riverice-cookbook
# Recipe:: ldm
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

iptables_ng_rule '388-ldm-tcp' do
  name '388-ldm-tcp'
  chain 'INPUT'
  table 'filter'
  rule '-m state --state NEW -p tcp -s 137.229.19.0/24,10.19.16.0/23,10.0.19.0/24 --dport 388 -j ACCEPT'
  ip_version 4
  action :create
end
iptables_ng_rule '388-ldm-udp' do
  name '388-ldm-udp'
  chain 'INPUT'
  table 'filter'
  rule '-p udp -s 137.229.19.0/24,10.19.16.0/23,10.0.19.0/24 --dport 388 -j ACCEPT'
  ip_version 4
  action :create
end

file '/opt/ldm/var/queues/ldm.pq' do
  mode '0664'
  only_if { ::FileTest.exists?('/opt/ldm/var/queues/ldm.pq') }
end

group 'ldm' do
  append true
  members node['riverice']['user']
  action :modify
end
