a=$(stat -L -c "%a" /etc/issue)
b=$(stat -L -c "%u %g" /etc/issue)

echo $a $b