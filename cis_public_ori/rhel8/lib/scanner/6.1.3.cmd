a=$(stat -L -c "%a" /etc/passwd-)
b=$(stat -L -c "%u %g" /etc/passwd-)

echo $a $b