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
end
