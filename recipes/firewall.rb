#
# Cookbook Name:: riverice
# Recipe:: firewall
#
# The MIT License (MIT)
#
# Copyright:: 2018, UAF GINA
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
# open firewall rules from environment

include_recipe 'gina_firewall::default'

# pull in ssh from partner networks
node['gmuflood']['networks'].each do |ntwrk|
  firewall_rule "from-env-#{ntwrk['note']}" do
    port 22
    source ntwrk['network']
    command :allow
  end
end

networks = %w( 137.229.19.0/24 10.19.16.0/24 10.0.19.0/24 )
networks.each do |iprange|
  firewall_rule "388-ldm-tcp-#{iprange}" do
    port 388
    protocol :tcp
    source iprange
    command :allow
  end
  firewall_rule "388-ldm-udp-#{iprange}" do
    port 388
    protocol :udp
    source iprange
    command :allow
  end 
end
