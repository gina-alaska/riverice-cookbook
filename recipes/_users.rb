gmuflood_users = search(:users, 'groups:gmuflood')

gmuflood_ssh_keys = []

# if we've set ssh keys in gmuflood environment, add them
if node['gmuflood'] && node['gmuflood']['ssh_keys']
  gmuflood_ssh_keys.push node['gmuflood']['ssh_keys']

end

# add keys for users belonging to gmuflood group in data bags
gmuflood_users.each do |userinfo|
  next if userinfo['action'] && userinfo['action'].include?('remove')
  gmuflood_ssh_keys += userinfo['ssh_keys'] if userinfo['ssh_keys']
end

# update node with all keys
node['gmuflood']['ssh_keys'] = gmuflood_ssh_keys

# assign all keys to gmuflood' authorized_keys file
gmuflood_user 'gmuflood' do
  ssh_keys gmuflood_ssh_keys
end
