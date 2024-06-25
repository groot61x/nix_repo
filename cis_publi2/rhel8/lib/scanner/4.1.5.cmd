a=$(auditctl -l | grep -e "\-w /var/run/utmp \-p wa \-k session" && \
auditctl -l | grep "\-w /var/log/wtmp \-p wa \-k logins" && \
auditctl -l | grep "\-w /var/log/btmp \-p wa \-k logins")

echo $a