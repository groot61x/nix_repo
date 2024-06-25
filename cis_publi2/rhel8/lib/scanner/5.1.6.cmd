a=$(stat -L -c "%a" /etc/cron.monthly)
b=$(stat -L -c "%u %g" /etc/cron.monthly)

echo $a $b