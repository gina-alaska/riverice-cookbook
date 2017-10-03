# riverice cookbook
The cookbook to manage riverice.gina.alaska.edu

# Usage
Include riverice::default in your run list.  Ensure

# Attributes

## partner_networks - firewall managment

node['riverice']['partner_networks'] is an array of networks that are provided ssh and LDM firewall exceptions. By default only GINA networks are allowed to connect via SSH and LDM. Format is `192.168.1.0/24`

# Recipes

# Production 

# Authors

* Scott Macfarlane (<scott@gina.alaska.edu>)
* Will Fisher
* Dayne Broderson
