a=$(grep "^Umask" /etc/proftpd.conf | awk '{ print $2 }')

echo $a