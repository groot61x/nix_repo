#a=$(auditctl -l | grep -e "\-w /etc/localtime \-p wa \-k time-change" && \
#auditctl -l | grep -e "\-a always,exit \-F arch=b64 \-S adjtimex,settimeofday \-F key=time-change" && \
#auditctl -l | grep -e "\-a always,exit \-F arch=b32 \-S stime,settimeofday,adjtimex \-F key=time-change" && \
#auditctl -l | grep -e "\-a always,exit \-F arch=b64 \-S clock_settime \-F key=time-change" && \
#auditctl -l | grep -e "\-a always,exit \-F arch=b32 \-S clock_settime \-F key=time-change")

a=$(auditctl -l | grep "key=time-change")

echo $a