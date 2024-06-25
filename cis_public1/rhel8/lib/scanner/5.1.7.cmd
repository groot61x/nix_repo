a=$(stat -L -c "%a" /etc/cron.d)
b=$(stat -L -c "%u %g" /etc/cron.d)

echo $a $b