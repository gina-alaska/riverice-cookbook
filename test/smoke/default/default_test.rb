# # encoding: utf-8

# Inspec test for riverice-cookbook

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe file('/usr/local/lib/libsz.so') do
   it { should exist }
end

describe user('gmuflood') do
   it { should exist }
   its('home') { should eq '/home/gmuflood' }
end

describe package ('hdf-devel') do
   it { should be_installed }
end

describe package ('hdf5-devel') do
   it { should be_installed }
end

describe package ('epel-release') do
   it { should be_installed }
end

describe package ('python') do
   it { should be_installed }
end

describe package ('python2-pip') do
   it { should be_installed }
end

describe package ('gcc') do
   it { should be_installed }
end

describe package ('gcc-c++') do
   it { should be_installed }
end
