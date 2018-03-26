# riverice cookbook
The cookbook to manage riverice.gina.alaska.edu

# Contents
The riverice cookbook installs and configures the following:
* Centos Operating System
* User accounts as requested by the project stakeholders
* Required Software pkgs and their dependencies:
  * Polar2grid
  * Production LDM server
  * GINA mirror_products.sh (launched via cron)


# Usage
Include riverice::default in your run list.  

# Attributes

## partner_networks - firewall managment

node['riverice']['partner_networks'] is an array of networks that are provided ssh and LDM firewall exceptions. By default only GINA networks are allowed to connect via SSH and LDM. Format is `192.168.1.0/24`

# Recipes

# Production 

# Authors

* support@gina.alaska.edu
* Scott Macfarlane 
* Will Fisher
* Dayne Broderson
