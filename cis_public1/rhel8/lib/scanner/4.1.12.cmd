a=$(auditctl -l | grep -e "\-a always,exit \-F arch=b64 \-S mount \-F auid>=1000 \-F auid!=-1 \-F key=mounts" && \
auditctl -l | grep -e "\-a always,exit \-F arch=b32 \-S mount \-F auid>=1000 \-F auid!=-1 \-F key=mounts" )

echo $a
