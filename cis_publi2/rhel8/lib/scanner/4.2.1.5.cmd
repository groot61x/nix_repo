a=$(grep "^*.*[^I][^I]*@" /etc/rsyslog.conf) 

if [ -f /etc/rsyslog.d/*.conf ];then
  b=$(grep "^*.*[^I][^I]*@" /etc/rsyslog.d/*.conf)
fi

echo "$a"
echo "$b"