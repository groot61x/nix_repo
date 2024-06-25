a=$(grep "cis" /etc/security/audit_event | awk -F: '{ print $2 }' | egrep 'AUE_ACCEPT|AUE_CONNECT|AUE_SOCKACCEPT|AUE_SOCKCONNECT|AUE_inetd_connect' | sort)

echo $a