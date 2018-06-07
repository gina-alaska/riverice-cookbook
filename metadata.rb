name             'riverice'
maintainer       'UAFGINA'
maintainer_email 'support@gina.alaska.edu'
license          'All rights reserved'
description      'Installs and configures riverice software dependencies' 
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.0.7'

depends 'gina_firewall'
depends 'ldm'
depends 'user'
depends 'sudo'
