default['riverice']['user'] = 'gmuflood'
default['riverice']['packages'] = %w{
  hdf5-188-gcc-devel hdf netcdf4311-gcc-hdf5-1812
  csh environment-modules szip
}
default['riverice']['modules_src_url'] = "http://downloads.sourceforge.net/project/modules/Modules/modules-3.2.10/modules-3.2.10.tar.gz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fmodules%2Ffiles%2F&ts=1397161649&use_mirror=softlayer-dal"
default['riverice']['lmod_src_url'] = "http://downloads.sourceforge.net/project/lmod/Lmod-5.4.tar.bz2?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Flmod%2Ffiles%2F&ts=1397499720&use_mirror=softlayer-dal"
