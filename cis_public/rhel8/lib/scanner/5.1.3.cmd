a=$(stat -L -c "%a" /etc/cron.hourly)
b=$(stat -L -c "%u %g" /etc/cron.hourly)

echo $a $b