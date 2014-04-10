#
# Cookbook Name:: riverice
# Recipe:: default
#
# Copyright (C) 2014 UAFGINA
# 
# All rights reserved - Do Not Redistribute
#

include_recipe 'yum::epel'
include_recipe 'riverice::szip'

user 'processing'

node['riverice']['packages'].each do |pkg|
	package pkg
end

include_recipe "riverice::python"
include_recipe "build-essential"

include_recipe "riverice::env"
include_recipe "riverice::ms2gt"
include_recipe "riverice::modules"
include_recipe "riverice::mounts"
#matlab
#idl