a=$(stat -L -c "%a" /etc/shadow-)
b=$(stat -L -c "%u %g" /etc/shadow-)

echo $a $b