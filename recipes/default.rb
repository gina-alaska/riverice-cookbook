#
# Cookbook Name:: riverice
# Recipe:: default
#
# Copyright (C) 2014 UAFGINA
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'yum-epel'
include_recipe 'yum-puias'

# user 'processing'

sudo 'processing' do
  user node['riverice']['user']
  runas node['riverice']['user']
  nopasswd true
  commands ['/usr/bin/yum']
end

package node['riverice']['packages']

include_recipe 'build-essential'
include_recipe 'riverice::python'
include_recipe 'riverice::env'
# include_recipe "riverice::ms2gt"
include_recipe 'riverice::lmod'
include_recipe 'riverice::mounts'
include_recipe 'riverice::mirror_data'

# TODO: update idl cookbook to handle no url being set
include_recipe 'idl' if node['idl']['url']

include_recipe 'ldm::default'
include_recipe 'riverice::ldm'

# TODO: matlab - currently not easily automated, requires installing on system with gui, zipping up
#          and copying over to target system.  Then manually installing required packages
