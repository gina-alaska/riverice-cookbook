directory "/mnt/snpp"

mount "/mnt/snpp" do
	fstype "nfs"
	device "icarus.gina.alaska.edu:/san/nppup-data"
	options "ro"
	action [:mount, :enable]
end

link "/home/#{node['riverice']['user']}/viirs" do
	to "/mnt/snpp"
end