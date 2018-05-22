#include_recipe 'nfs::default'

directory '/mnt/data'
directory '/mnt/data/scratch'

mount '/mnt/data' do
  device '/dev/mapper/VolGroupArray-lvdata'
  options 'rw'
  action [:mount, :enable]
  only_if { ::FileTest.exists?('/dev/mapper/VolGroupArray-lvdata') }
  notifies :create, 'directory[/mnt/data/scratch]', :immediately
end

directory '/mnt/data/scratch' do
  user node['riverice']['user']
  group node['riverice']['user']
  action :nothing
end

link "/home/#{node['riverice']['user']}/scratch" do
  to '/mnt/data/scratch'
end
