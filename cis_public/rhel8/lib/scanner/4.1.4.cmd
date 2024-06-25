a=$(auditctl -l | grep -e "\-w /var/log/lastlog \-p wa \-k logins" && \
auditctl -l | grep "\-w /var/run/faillock \-p wa \-k logins")
echo $a