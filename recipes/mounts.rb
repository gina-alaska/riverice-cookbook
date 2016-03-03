include_recipe 'nfs::default'

mount "/mnt/snpp" do
	device "icarus.gina.alaska.edu:/san/nppup-data"
	fstype "nfs"
	options "ro"
	action [:umount, :disable]
end

directory "/mnt/data"

mount "/mnt/data" do
	device "/dev/mapper/VolGroupArray-lvdata"
	options "rw"
	action [:mount, :enable]
	only_if { ::FileTest.exists?("/dev/mapper/VolGroupArray-lvdata") }
  notifies :create, 'directory[/mnt/data/scratch]', :immediately
end

directory "/mnt/data/scratch" do
  user node['riverice']['user']
  group node['riverice']['user']
  action :nothing
end

link "/home/#{node['riverice']['user']}/scratch" do
	to "/mnt/data/scratch"
end
