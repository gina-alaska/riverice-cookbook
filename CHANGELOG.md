# Changelog

## Unreleased

## 1.0.0 - 2018-03-12
- completely revamping all recipes for new hardware and centos7

## 0.8.1 - 2017-10-03
- add use of `node['riverice]['partner_networks']` array to provide ssh and ldm 
  access to partner networks.  Format: `192.168.1.0/24`

## 0.8.0 - 2017-09-22
- merge the updates from https://github.com/gina-alaska/riverice-cookbook/pull/3
  as part of the migration from RCS Chef to OIT chef.alaska.edu 
  unfinished thoughts put in https://github.com/gina-alaska/riverice-cookbook/issues/6
- remove dependancy on ldm-cookbook
- remove use of gina-iptables cookbook in favor of new gina\_firewall
- disable riverice::python (TODO - work with Jay Hoffman)

## 0.7.4 - 2017-04-13
- last major version managed by Will