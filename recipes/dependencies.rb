#
# The MIT License (MIT)
#
# Copyright (c) 2016 UAF GINA
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

package %w( epel-release )
package %w( python python-devel python-pip hdf-devel hdf5-devel gcc gcc-c++ ) # devel includes "base" hdf4 and hdf5
package %w( blas-devel lapack-devel libjpeg-devel netcdf-devel )
package %w( libXp libXpm libXmu )
package %w( libxml2-python libxml2-devel )
package %w( environment-modules m4 )

execute "pip install --upgrade pip"
execute "pip install --upgrade setuptools"

%w( pillow numpy scipy netCDF4 ).each do |python_module|
  execute "pip install #{python_module}"
end

# install szip in /usr/local/bin
remote_file '/tmp/szip-2.1.1.tar.gz' do
  source 'https://support.hdfgroup.org/ftp/lib-external/szip/2.1.1/src/szip-2.1.1.tar.gz'
  action :create_if_missing
end

execute 'extract_tarball' do
  cwd '/tmp'
  command 'tar xzvf szip-2.1.1.tar.gz' 
  not_if { ::File.directory?('/tmp/szip-2.1.1') }
end

bash 'build_szip' do
  cwd '/tmp/szip-2.1.1'
  code <<-EOH
     ./configure --prefix=/usr/local
     make 
     make check
     make install
     EOH
  not_if { ::File.exists?('/usr/local/lib/libsz.so') }
end

# not installing this, hasn't been accessed since 2014 on riverice.gina
#netcdf42-gcc-hdf5-188-devel
#ENV['HDF5_DIR'] = '/usr/local/netcdf/gcc/hdf5-1.8.8/4.2'
