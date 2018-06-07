# fix this in the future someday
# add g+w to /opt/ldm/var/queues/ldm.pq
#file '/opt/ldm/var/queues/ldm.pq' do
#  mode '0664'
#end

# add gmuflood to group ldm
group 'ldm' do
  members ['gmuflood']
  append  true
end
