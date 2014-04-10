remote_file "#{Chef::Config[:file_cache_path]}/szip-2.1-1.puias6.x86_64.rpm" do
  source "http://puias.math.ias.edu/data/puias/computational/6/x86_64/szip-2.1-1.puias6.x86_64.rpm"
end

rpm_package "#{Chef::Config[:file_cache_path]}/szip-2.1-1.puias6.x86_64.rpm" 
