%w{lua-devel lua-posix lua-filesystem}.each do |pkg|
	package pkg
end

remote_file "#{Chef::Config[:file_cache_path]}/lmod-5.4.tar.bz2" do
	source node['riverice']['lmod_src_url'] 
	notifies :run, 'script[install_lmod]'
end


script "install_lmod" do
	cwd Chef::Config[:file_cache_path]
	interpreter "bash"
	code <<-EOC
	tar xvjf lmod-5.4.tar.bz2
	cd Lmod-5.4
	./configure --prefix=/opt/lmod --with-spiderCacheDir=/opt/lmod/moduleData/cacheDir \
	  --with-updateSystemFn=/opt/lmod/moduleData/system.txt
	make
	make install
	EOC
	action :nothing
end