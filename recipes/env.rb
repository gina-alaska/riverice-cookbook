#
# Create an .bashrc.d-style directory for arbitrary loading.
#
directory "/home/#{node['riverice']['user']}/.bashrc.d" do
	owner node['riverice']['user']
	mode '0755'
end

#
# Write a .bash_profile that just loads .bashrc
#
file "/home/#{node['riverice']['user']}/.bash_profile" do
	owner node['riverice']['user']
	mode '0644'
	content <<-EOH.gsub(/^ {4}/, '')
    # This file is written by Chef for #{node['fqdn']}.
    # Do NOT modify this file by hand.

    # Source our bashrc
    if [ -f ~/.bashrc ]; then
    source ~/.bashrc
    fi
	EOH
end

#
# Load the regular profile
#
file "/home/#{node['riverice']['user']}/.bashrc" do
	owner node['riverice']['user']
	mode '0644'
	content <<-EOH.gsub(/^ {4}/, '')
    # This file is written by Chef for #{node['fqdn']}.
    # Do NOT modify this file by hand.

    # Source the system /etc/bashrc
    if [ -f /etc/bashrc ]; then
    source /etc/bashrc
    fi

    # Source all our .d files
    if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
    test -f "$rc" || continue
    test -x "$rc" || continue
    source "$rc"
    done
    fi
	EOH
end
