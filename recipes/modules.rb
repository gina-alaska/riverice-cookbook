#TODO: This should be its own cookbook
#TODO: Modules rpm

package 'tcl-devel'

remote_file "#{Chef::Config[:file_cache_path]}/modules-3.2.10.tar.gz" do
	source node['riverice']['modules_src_url']
	notifies :run, 'script[build_modules]', :immediately
end

script 'build_modules' do
	interpreter "bash"
	cwd Chef::Config[:file_cache_path]
	code <<-EOC
	tar xvzf modules-3.2.10.tar.gz
	cd modules-3.2.10
	./configure 
	make
	make install
	EOC
end

template "/home/#{node['riverice']['user']}/.bashrc.d/modules.sh" do
	source "modules.sh.erb"
	owner node['riverice']['user']
	mode "0744"
end