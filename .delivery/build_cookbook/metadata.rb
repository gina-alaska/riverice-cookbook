name 'build_cookbook'
maintainer 'UAF GINA'
maintainer_email 'support+chef@gina.alaska.edu'
license 'mit'
version '0.1.0'
chef_version '>= 12.1' if respond_to?(:chef_version)

depends 'delivery-truck'
