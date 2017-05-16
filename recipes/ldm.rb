#
# Cookbook Name:: riverice-cookbook
# Recipe:: ldm
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'gina_firewall::default'

%w{ 137.229.19.0/24 10.19.16.0/24 10.0.19.0/24 }.each do |iprange|
  firewall_rule "388-ldm-tcp-#{iprange}" do
    port 388
    source iprange
    command :allow
  end
  firewall_rule "388-ldm-udp-#{iprange}" do
    port 388
    protocol :udp
    source iprange
    command :allow
  end
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
