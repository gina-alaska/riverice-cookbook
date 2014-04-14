#
# Cookbook Name:: riverice
# Recipe:: default
#
# Copyright (C) 2014 UAFGINA
# 
# All rights reserved - Do Not Redistribute
#

include_recipe 'yum::epel'

user 'processing'

sudo 'processing' do
	user node['riverice']['user']
	runas node['riverice']['user']
	nopasswd true
	commands ['/usr/bin/yum']
end

node['riverice']['packages'].each do |pkg|
	package pkg
end

include_recipe "build-essential"
include_recipe 'riverice::szip'
include_recipe "riverice::python"
include_recipe "riverice::env"
include_recipe "riverice::ms2gt"
include_recipe "riverice::modules"
include_recipe "riverice::lmod"
include_recipe "riverice::mounts"
# TODO: 
# matlab
# idl