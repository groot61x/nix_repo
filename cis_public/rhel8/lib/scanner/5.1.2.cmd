a=$(stat -L -c "%a" /etc/crontab)
b=$(stat -L -c "%u %g" /etc/crontab)

echo $a $b