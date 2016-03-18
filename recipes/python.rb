# include_recipe "python"
python_runtime '2' do
  provider :system
end

package %w{ blas-devel lapack-devel libjpeg libjpeg-devel hdf5-devel netcdf-devel netcdf42-gcc-hdf5-188-devel }

ENV["HDF5_DIR"] = "/usr/local/netcdf/gcc/hdf5-1.8.8/4.2"
%w{ pillow numpy scipy netCDF4 }.each do |python_module|
  python_package python_module
end
