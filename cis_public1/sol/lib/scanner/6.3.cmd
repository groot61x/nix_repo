a=$(ls /etc/cron.d/cron.deny 2>&1 | grep "No such file"  | wc -l)

b=$(ls /etc/cron.d/at.deny 2>&1 | grep "No such file"  | wc -l)

c=$(cat /etc/cron.d/cron.allow 2>&1 | egrep -v 'root' | wc -l)

d=$(wc -l /etc/cron.d/at.allow 2>&1 | awk '{ print $1 }')

echo $a $b $c $d
