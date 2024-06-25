a=$(stat -L -c "%a" /etc/issue.net)
b=$(stat -L -c "%u %g" /etc/issue.net)

echo $a $b