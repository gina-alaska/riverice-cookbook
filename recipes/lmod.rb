package %w{lua-devel lua-posix lua-filesystem rsync}

remote_file "#{Chef::Config[:file_cache_path]}/lmod-5.4.tar.bz2" do
	source node['riverice']['lmod_src_url']
	notifies :run, 'script[install_lmod]'
  not_if { ::File.exists?('/opt/apps') }
end


script "install_lmod" do
	cwd Chef::Config[:file_cache_path]
	interpreter "bash"
	code <<-EOC
	tar xvjf lmod-5.4.tar.bz2
	cd Lmod-5.4
	./configure --prefix=/opt/apps --with-spiderCacheDir=/opt/apps/lmod/moduleData/cacheDir \
	  --with-updateSystemFn=/opt/apps/lmod/moduleData/system.txt
	make
	make install
	EOC
	action :nothing
end
