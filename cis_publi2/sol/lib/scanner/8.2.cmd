a=$(grep "DisplayConnect" /etc/proftpd.conf | awk '{print $1 " " $2}')

echo "$a"