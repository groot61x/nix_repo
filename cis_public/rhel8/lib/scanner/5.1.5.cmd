a=$(stat -L -c "%a" /etc/cron.weekly)
b=$(stat -L -c "%u %g" /etc/cron.weekly)

echo $a $b