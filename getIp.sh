ifconfig eth0 | grep 'inet ' | awk '{ print $2}'
