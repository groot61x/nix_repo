a=$([ -e /etc/cron.deny ] && stat /etc/cron.deny)
b=$([ -e /etc/at.deny ] && stat /etc/at.deny)



c=$(stat -L -c "%a" /etc/cron.allow)
d=$(stat -L -c "%u %g" /etc/cron.allow)

e=$(stat -L -c "%a" /etc/cron.allow)
f=$(stat -L -c "%u %g" /etc/cron.allow)

echo $a $b $c $d $e $f