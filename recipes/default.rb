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

include_recipe "build-essential"
include_recipe "riverice::python"
include_recipe "riverice::env"
#include_recipe "riverice::ms2gt"
include_recipe "riverice::lmod"
include_recipe "riverice::mounts"
include_recipe "riverice::mirror_data"
# TODO:
# matlab
# idl
