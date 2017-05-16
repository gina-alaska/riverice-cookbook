default['riverice']['user'] = 'gmuflood'
default['riverice']['packages'] = %w(
  hdf5-188-gcc-devel hdf netcdf4311-gcc-hdf5-1812
  csh environment-modules szip zip unzip
  libXext-devel libXt-devel libXcomposite-devel
)
default['riverice']['modules_src_url'] = 'http://downloads.sourceforge.net/project/modules/Modules/modules-3.2.10/modules-3.2.10.tar.gz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fmodules%2Ffiles%2F&ts=1397161649&use_mirror=softlayer-dal'
default['riverice']['lmod_src_url'] = 'http://downloads.sourceforge.net/project/lmod/Lmod-5.4.tar.bz2?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Flmod%2Ffiles%2F&ts=1397499720&use_mirror=softlayer-dal'

default['riverice']['snpp_data'] = '/mnt/data/snpp'
# accepts what would be given crontab
default['riverice']['fetch_cron_action'] = 'create'

default['ldm']['source'] = 'ftp://ftp.unidata.ucar.edu/pub/ldm/ldm-6.12.14.tar.gz'
default['ldm']['checksum'] = '41205ee7b75ddc552d243bc2dbb39f79c076ce87bf75a7d42f90dff96ecea84d'
default['ldm']['requests'] = []
default['ldm']['allows'] = [
  {
    feedset: 'ANY',
    hostname: '(10.19.16.*)',
    ok: '.*',
  },
  {
    feedset: 'ANY',
    hostname: '(137.229.19.*)',
    ok: '.*',
  },
]
default['ldm']['accepts'] = []
default['ldm']['scours'] = [
  {
    directory: '/opt/ldm/data',
    days_old: '3',
    pattern: '*',
  },
]
