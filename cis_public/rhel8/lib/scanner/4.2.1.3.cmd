grep ^\$FileCreateMode /etc/rsyslog.conf 

if [ -f /etc/rsyslog.d/*.conf ];then
  grep ^\$FileCreateMode /etc/rsyslog.d/*.conf
fi  