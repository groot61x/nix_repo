a=$(stat -L -c "%a" /etc/group)
b=$(stat -L -c "%u %g" /etc/group)

echo $a $b