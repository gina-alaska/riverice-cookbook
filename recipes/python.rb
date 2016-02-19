# include_recipe "python"
python_runtime '2'

package %w{ blas-devel lapack-devel libjpeg libjpeg-devel hdf5-devel netcdf-devel netcdf42-gcc-hdf5-188-devel }

python_package "pillow"
python_package "numpy"
python_package "scipy" do
	timeout 3600
end

ENV["HDF5_DIR"] = "/usr/local/netcdf/gcc/hdf5-1.8.8/4.2"
python_package "netCDF4"
