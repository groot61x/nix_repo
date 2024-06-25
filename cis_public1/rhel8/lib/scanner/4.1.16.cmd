# auditctl -l | grep -P  -- "^\h*-w\h+$(grep -r logfile /etc/sudoers* | sed -e 's/.*logfile=//;s/,? .*//' | tr -d \")\h+-p\h+wa\h+-k\h+\H+\h*(\h+.*)?$"

a=$(auditctl -l | grep /var/log/sudo.log)

echo $a




