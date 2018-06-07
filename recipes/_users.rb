gmuflood_users = search(:users, 'groups:gmuflood')

gmuflood_ssh_keys = []

# if we've set ssh keys in gmuflood environment, add them
if node['gmuflood'] && node['gmuflood']['ssh_keys']
  node['gmuflood']['ssh_keys'].each do |key|
    gmuflood_ssh_keys.push key
  end
end

# add keys for users belonging to gmuflood group in data bags
gmuflood_users.each do |userinfo|
  next if userinfo['action'] && userinfo['action'].include?('remove')
  gmuflood_ssh_keys += userinfo['ssh_keys'] if userinfo['ssh_keys']
end

# update node with all keys
node.default['gmuflood']['ssh_keys'] = gmuflood_ssh_keys

# create new gmuflood user and assign all keys to authorized_keys file
group 'gmuflood' do
  gid 7000
  action :create
end

user_account 'gmuflood' do
  comment 'shared GMU Flood user'
  home '/home/gmuflood'
  shell '/bin/bash'
  uid 7000
  gid 7000
  ssh_keys gmuflood_ssh_keys
  ssh_keygen false
  action :create
end

sudo 'processing' do
  user node['riverice']['user']
  runas node['riverice']['user']
  nopasswd true
  commands ['/usr/bin/yum']
end

# copy /etc/skel/.bash_profile here 
