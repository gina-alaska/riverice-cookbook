name             'riverice'
maintainer       'UAFGINA'
maintainer_email 'scott@gina.alaska.edu'
license          'All rights reserved'
description      'Installs/Configures riverice algorithms'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.7.2'

depends 'poise-python'
depends 'build-essential'
depends 'yum', '~> 3.0'
depends 'yum-epel'
depends 'yum-puias'
depends 'sudo'
depends 'nfs'
depends 'idl'
depends 'ldm'
depends 'gina-iptables'
