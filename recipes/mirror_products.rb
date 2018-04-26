#
# Cookbook Name:: riverice
# Recipe:: mirror_products 
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
  source 'mirror_products.sh'
  mode '0755'
  user node['riverice']['user']
  group node['riverice']['user']
end
