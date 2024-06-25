a=$(stat -L -c "%a" /etc/motd)
b=$(stat -L -c "%u %g" /etc/motd)

echo $a $b
