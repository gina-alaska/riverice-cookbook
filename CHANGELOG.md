# Changelog

## Unreleased

## 1.0.7 - 2018-06-07
- fixing behavior diff on prod system than kitchen converge

## 1.0.6 - 2018-06-07
- fixing syntax bug in group membership for ldm

## 1.0.5 - 2018-05-25
- corrected script name in crontab entry

## 1.0.4 - 2018-05-24
- updating crontab for newer ice_cron version
- pulled szip installation, was failing to do as intended

## 1.0.3 - 2018-05-22
- adding 664 permissions to ldm queue
- adding gmuflood user to ldm group

## 1.0.2 - 2018-05-01
- pulling in github.com/gina-alaska/ldm-cookbook

## 1.0.1 - 2018-04-30
- dependencies for manual installation of idl and matlab
- fixed wrong firewall syntax pulling from environment

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
