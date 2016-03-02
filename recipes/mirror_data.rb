directory node['riverice']['snpp_data'] do
  user node['riverice']['user']
  group node['riverice']['user']
end

link "/home/#{node['riverice']['user']}/viirs" do
	to node['riverice']['snpp_data']
end


directory "/home/#{node['riverice']['user']}/bin" do
  user node['riverice']['user']
  group node['riverice']['user']
end

mirror_script = "/home/#{node['riverice']['user']}/bin/mirror_products.sh"

template mirror_script do
  source "mirror_products.sh"
  mode '0755'
  user node['riverice']['user']
  group node['riverice']['user']
end

cron "mirror_viirs_products" do
  user node['riverice']['user']
  command "#{mirror_script} -f uafgina -i viirs -p level1 -o '#{node['riverice']['snpp_data']}'"
  minute '*/15'
  action node['riverice']['fetch_cron_action']
end
