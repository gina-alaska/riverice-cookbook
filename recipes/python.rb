include_recipe "python"


%w{ blas-devel lapack-devel }.each do |pkg|
	package pkg
end

python_pip "pillow"
python_pip "numpy"
python_pip "scipy"
python_pip "netCDF4"
