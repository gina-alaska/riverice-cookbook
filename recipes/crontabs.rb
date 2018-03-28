#
# Cookbook Name:: crontabs
# Recipe:: crontabs
#
# The MIT License (MIT)
#
# Copyright:: 2018, UAF GINA
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

# 32 * * * * /home/gmuflood/scripts/ice_cron.v32.gina.sh >  /home/gmuflood/scripts/logs/log.32.txt 2>&1
cron 'ice-cron32' do
  shell "/bin/bash"
  minute '32'
  user 'gmuflood'
  command "/home/gmuflood/scripts/ice_cron.v32.gina.sh >  /home/gmuflood/scripts/logs/log.32.txt 2>&1"
end

#*/15 * * * *  /bin/bash -l -c '/home/gmuflood/VIIRS_Flood/bin/FloodDriver-op.plx --start "0" --end "24" > /home/gmuflood/scratch/VIIRS/logs/"`date +\%Y\%j\%H\%M`".log.txt 2>&1 '
cron 'flooddriver' do
  shell "/bin/bash"
  minute '0,15,30,45'
  user 'gmuflood'
  command "/home/gmuflood/VIIRS_Flood/bin/FloodDriver-op.plx --start "0" --end "24" > /home/gmuflood/scratch/VIIRS/logs/"`date +\%Y\%j\%H\%M`".log.txt 2>&1"
end

#0 18 * * * /bin/bash -l -c 'find /mnt/data/snpp/ -mtime +12 -delete' 
cron 'delete-file' do
  shell "/bin/bash"
  minute '0'
  hour '18'
  user 'gmuflood'
  command "/bin/bash -l -c 'find /mnt/data/snpp/ -mtime +12 -delete"
end

#0 21 * * * /bin/bash -l -c 'find /mnt/data/snpp/ -type d -empty -delete'
cron 'delete-dir' do
  shell "/bin/bash"
  minute '0'
  hour '21'
  user 'gmuflood'
  command "/bin/bash -l -c 'find /mnt/data/snpp/ -type d -empty -delete"
end

# */15 * * * * /home/gmuflood/bin/mirror_products.sh -n -f gilmore -i viirs -p level1 -p level2 -o '/mnt/data/snpp'
cron 'mirror-script' do
  shell "/bin/bash"
  minute '0,15,30,45'
  user 'gmuflood'
  command "/home/gmuflood/bin/mirror_products.sh -n -f gilmore -i viirs -p level1 -p level2 -o '/mnt/data/snpp'"
end
