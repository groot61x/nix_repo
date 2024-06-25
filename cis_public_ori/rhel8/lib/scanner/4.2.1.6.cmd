#a=$(grep '$ModLoad imtcp' /etc/rsyslog.conf) 

#if [ -f /etc/rsyslog.d/*.conf ];then
#  b=$(grep '$ModLoad imtcp' /etc/rsyslog.d/*.conf)
#fi

cat /etc/rsyslog.conf | grep -v '^#' | grep "@@"
