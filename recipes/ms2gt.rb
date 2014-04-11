directory "/opt/ms2gt" do 
	owner node['riverice']['user']
	group node['riverice']['user']
end

remote_file "#{Chef::Config[:file_cache_path]}/ms2gt0.5.tar.gz" do
	source "ftp://sidads.colorado.edu/pub/NSIDC/ms2gt0.5.tar.gz"
	notifies :run, "script[install_ms2gt]", :immediately
end

script "install_ms2gt" do
	interpreter "bash"
	cwd Chef::Config[:file_cache_path]
	code <<-EOC
	tar xvzf ms2gt0.5.tar.gz
	cd ms2gt/src
	make all
	cd ..
	cp -R * /opt/ms2gt
	chown -R #{node['riverice']['user']}.#{node['riverice']['user']} /opt/ms2gt
	EOC
	action :nothing
end

template "/home/#{node['riverice']['user']}/.bashrc.d/ms2gt.sh" do
	source "ms2gt.sh.erb"
	mode "0744"
	owner node['riverice']['user']
	variables({ path: "/opt/ms2gt/bin"})
end