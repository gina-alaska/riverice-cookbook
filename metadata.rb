name             'riverice'
maintainer       'UAFGINA'
maintainer_email 'scott@gina.alaska.edu'
license          'All rights reserved'
description      'Installs/Configures riverice algorithms'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.0'

depends 'python'
depends 'build-essential'
depends 'yum', '~> 2.0'
depends 'sudo'